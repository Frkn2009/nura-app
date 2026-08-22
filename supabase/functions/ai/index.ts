// NURA — AI Edge Function
// -------------------------
// Sunucu tarafında gerçek bir LLM'e (OpenAI uyumlu) bağlanır ve NURA'nın
// üç AI işlevini döndürür:
//   - feedback : konuşma sonrası cümle geri bildirimi + skor
//   - scenario : seviyeye göre diyalog senaryosu
//   - summary  : günlük hafıza raporu
//
// LLM anahtarı Flutter istemcisinde DEĞİL, yalnızca sunucuda durur.
// Ortam değişkenleri: OPENAI_API_KEY (zorunlu), OPENAI_BASE_URL (opsiyonel).
//
// Hata durumunda { error: '...' } döner; Flutter tarafındaki
// SupabaseAiService böyle durumlarda otomatik olarak offline FakeAiService'e
// düşer, kullanıcı asla boş ekran görmez.

import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, apikey, content-type, x-client-info',
  'Access-Control-Allow-Methods': 'POST, OPTIONS',
};

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json; charset=utf-8' },
  });
}

type Action = 'feedback' | 'scenario' | 'summary';

function isAction(value: unknown): value is Action {
  return value === 'feedback' || value === 'scenario' || value === 'summary';
}

function cleanText(value: unknown): string {
  return typeof value === 'string' ? value.trim() : '';
}

async function callLlm(system: string, user: string): Promise<string> {
  const apiKey = Deno.env.get('OPENAI_API_KEY');
  const baseUrl = Deno.env.get('OPENAI_BASE_URL') || 'https://api.openai.com/v1';
  if (!apiKey) throw new LlmUnconfiguredError();

  const response = await fetch(`${baseUrl.replace(/\/$/, '')}/chat/completions`, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${apiKey}`,
    },
    body: JSON.stringify({
      model: Deno.env.get('OPENAI_MODEL') || 'gpt-4o-mini',
      temperature: 0.6,
      max_tokens: 1000,
      messages: [
        { role: 'system', content: system },
        { role: 'user', content: user },
      ],
    }),
  });

  if (!response.ok) {
    console.error('LLM provider failed', response.status, await response.text());
    throw new LlmUnavailableError();
  }

  const data = await response.json();
  const content = data?.choices?.[0]?.message?.content;
  if (typeof content !== 'string' || !content.trim()) {
    throw new LlmUnavailableError();
  }
  return content.trim();
}

class LlmUnconfiguredError extends Error {
  constructor() {
    super('llm_not_configured');
  }
}

class LlmUnavailableError extends Error {
  constructor() {
    super('llm_unavailable');
  }
}

/** LLM ham metninden bir JSON bloğu çıkarır (markdown kod çitlerini sıyırır). */
function extractJson(raw: string): unknown {
  let text = raw.trim();
  const fence = text.match(/```(?:json)?\s*([\s\S]*?)```/i);
  if (fence) text = fence[1].trim();
  const start = text.indexOf('{');
  const end = text.lastIndexOf('}');
  if (start === -1 || end === -1 || end <= start) {
    throw new LlmUnavailableError();
  }
  return JSON.parse(text.slice(start, end + 1));
}

function asList(value: unknown): string[] {
  if (!Array.isArray(value)) return [];
  return value.map(cleanText).filter((item) => item.length > 0);
}

async function handleFeedback(
  admin: ReturnType<typeof createClient>,
  userId: string,
  payload: Record<string, unknown>,
) {
  const sourceText = cleanText(payload['sourceText']).slice(0, 500);
  const userAnswer = cleanText(payload['userAnswer']).slice(0, 500);
  const target = cleanText(payload['targetLanguage']);
  const native = cleanText(payload['nativeLanguage']);
  if (!sourceText || !target) return json({ error: 'invalid_request' }, 400);

  const system =
    `You are Maya, NURA's friendly language coach. You correct and coach a learner ` +
    `writing in ${target} (learner's native language: ${native || 'English'}). ` +
    `Always answer with JSON only, no markdown, with this exact shape:\n` +
    `{"score":0,"correctedAnswer":"...","tips":["..."],"encouragement":"..."}\n` +
    `score is an integer 0-100 comparing the answer to the target sentence. ` +
    `correctedAnswer is the corrected target-language sentence (or the target if already right). ` +
    `tips: 2-4 short, kind, specific tips in ${native || 'English'}. encouragement: one upbeat line in ${native || 'English'}.`;

  const user =
    `Target sentence (${target}): "${sourceText}"\n` +
    `Learner's attempt: "${userAnswer || '(no speech detected)'}"`;

  const raw = await callLlm(system, user);
  const data = extractJson(raw) as Record<string, unknown>;

  const score = typeof data['score'] === 'number' ? Math.round(data['score']) : 50;
  return json({
    score: Math.max(0, Math.min(100, score)),
    correctedAnswer: cleanText(data['correctedAnswer']) || sourceText,
    tips: asList(data['tips']),
    encouragement: cleanText(data['encouragement']) || 'Harika ilerliyorsun, devam et!',
  });
}

async function handleScenario(payload: Record<string, unknown>) {
  const topic = cleanText(payload['topic']).slice(0, 120) || 'günlük konuşma';
  const level = cleanText(payload['level']) || 'a1';
  const target = cleanText(payload['targetLanguage']);
  const native = cleanText(payload['nativeLanguage']);
  if (!target) return json({ error: 'invalid_request' }, 400);

  const system =
    `You are Maya, NURA's scenario writer. Write a short dialogue in ${target} for a ` +
    `${level} learner whose native language is ${native || 'English'}. ` +
    `Answer with JSON only, no markdown, exact shape:\n` +
    `{"topic":"...","level":"...","dialogue":[{"speaker":"Maya","text":"...","translation":"..."}],` +
    `"vocabulary":[{"word":"...","translation":"...","example":"..."}]}\n` +
    `Keep the dialogue short (4-8 lines), grammar appropriate for ${level}, ` +
    `and every dialogue line and vocabulary entry includes a ${native || 'English'} translation.`;

  const user = `Topic: ${topic}. Language: ${target}. Level: ${level}.`;
  const raw = await callLlm(system, user);
  const data = extractJson(raw) as Record<string, unknown>;

  const dialogue = Array.isArray(data['dialogue'])
    ? (data['dialogue'] as unknown[]).map((line) => {
        const entry = line as Record<string, unknown>;
        return {
          speaker: cleanText(entry['speaker']) || 'Maya',
          text: cleanText(entry['text']),
          translation: cleanText(entry['translation']),
        };
      }).filter((line) => line.text.length > 0)
    : [];
  const vocabulary = Array.isArray(data['vocabulary'])
    ? (data['vocabulary'] as unknown[]).map((item) => {
        const entry = item as Record<string, unknown>;
        return {
          word: cleanText(entry['word']),
          translation: cleanText(entry['translation']),
          example: cleanText(entry['example']),
        };
      }).filter((item) => item.word.length > 0)
    : [];

  return json({
    topic: cleanText(data['topic']) || topic,
    level: cleanText(data['level']) || level,
    dialogue,
    vocabulary,
  });
}

async function handleSummary(payload: Record<string, unknown>) {
  const reviewed = typeof payload['reviewedCount'] === 'number' ? payload['reviewedCount'] : 0;
  const difficult = typeof payload['difficultCount'] === 'number' ? payload['difficultCount'] : 0;
  const mastered = typeof payload['masteredCount'] === 'number' ? payload['masteredCount'] : 0;
  const streak = typeof payload['streakDays'] === 'number' ? payload['streakDays'] : 0;
  const target = cleanText(payload['targetLanguage']) || 'your target language';
  const native = cleanText(payload['nativeLanguage']) || 'English';

  const system =
    `You are Maya, NURA's daily memory coach. Write a warm, encouraging daily summary in ` +
    `${native} for a learner of ${target}. Answer with JSON only, no markdown, exact shape:\n` +
    `{"message":"...","difficultWords":["..."]}\n` +
    `message: 1-2 sentences, acknowledge today's effort and motivate. ` +
    `difficultWords: up to 3 generic weak areas (or empty array if difficultCount is 0).`;

  const user =
    `Today: reviewed=${reviewed}, difficult=${difficult}, mastered=${mastered}, ` +
    `streakDays=${streak}. Target language: ${target}.`;

  const raw = await callLlm(system, user);
  const data = extractJson(raw) as Record<string, unknown>;

  return json({
    reviewedCount: reviewed,
    masteredCount: mastered,
    difficultWords: asList(data['difficultWords']),
    message: cleanText(data['message']) || 'Bugün de güzel ilerleme kaydettin!',
    streakDays: streak,
  });
}

Deno.serve(async (request) => {
  if (request.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });
  if (request.method !== 'POST') return json({ error: 'method_not_allowed' }, 405);

  const authorization = request.headers.get('Authorization');
  if (!authorization?.startsWith('Bearer ')) return json({ error: 'authentication_required' }, 401);

  const supabaseUrl = Deno.env.get('SUPABASE_URL');
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');
  if (!supabaseUrl || !serviceRoleKey) return json({ error: 'service_not_configured' }, 503);

  const admin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const jwt = authorization.slice('Bearer '.length);
  const { data: userData, error: userError } = await admin.auth.getUser(jwt);
  if (userError || !userData.user) return json({ error: 'invalid_session' }, 401);

  let payload: Record<string, unknown>;
  try {
    const body = await request.json();
    payload = (body && typeof body === 'object' ? body : {}) as Record<string, unknown>;
  } catch (_) {
    return json({ error: 'invalid_json' }, 400);
  }

  const action = payload['action'];
  if (!isAction(action)) return json({ error: 'invalid_action' }, 400);

  try {
    switch (action) {
      case 'feedback':
        return await handleFeedback(admin, userData.user.id, payload);
      case 'scenario':
        return await handleScenario(payload);
      case 'summary':
        return await handleSummary(payload);
    }
  } catch (error) {
    if (error instanceof LlmUnconfiguredError) {
      return json({ error: 'llm_not_configured' }, 503);
    }
    if (error instanceof LlmUnavailableError) {
      return json({ error: 'llm_unavailable' }, 502);
    }
    console.error('ai function error', error);
    return json({ error: 'internal_error' }, 500);
  }
});
