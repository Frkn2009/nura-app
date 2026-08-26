import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, apikey, content-type, x-client-info',
};

const supportedLanguages = new Set([
  'en', 'es', 'de', 'fr', 'nl', 'ar', 'pt', 'it', 'ru', 'zh',
  'ja', 'ko', 'tr', 'pl', 'sv', 'da', 'no', 'fi', 'el', 'cs',
  'ro', 'hu', 'hi', 'th', 'vi', 'id', 'uk', 'he', 'fa', 'sw',
]);

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json; charset=utf-8' },
  });
}

function decodeHtml(value: string) {
  const entities: Record<string, string> = {
    '&amp;': '&', '&quot;': '"', '&#39;': "'", '&lt;': '<', '&gt;': '>',
  };
  return value.replace(/&(?:amp|quot|#39|lt|gt);/g, (match) => entities[match]);
}

// Toplantı Çevirmeni: `translate` fonksiyonundan farklı olarak Plus/Business
// aboneliği ZORUNLU değil — Free katman da günde 5dk (+ödüllü videoyla bonus)
// kullanabiliyor, kota istemci tarafında (SessionController.interpreterSecondsUsed)
// tutuluyor; tıpkı mevcut ücretsiz konuşma dakikası (speakSecondsUsed) gibi
// sunucu tarafında ayrıca sayılmıyor. Buradaki tek zorunluluk geçerli bir
// Supabase oturumu (anonim girişte bile main.dart açılışta bunu garantiliyor)
// — amaç anahtarın (GOOGLE_TRANSLATE_API_KEY) istemciye hiç sızmaması.
Deno.serve(async (request) => {
  if (request.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });
  if (request.method !== 'POST') return json({ error: 'method_not_allowed' }, 405);

  const authorization = request.headers.get('Authorization');
  if (!authorization?.startsWith('Bearer ')) return json({ error: 'authentication_required' }, 401);

  const supabaseUrl = Deno.env.get('SUPABASE_URL');
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');
  const googleApiKey = Deno.env.get('GOOGLE_TRANSLATE_API_KEY');
  if (!supabaseUrl || !serviceRoleKey || !googleApiKey) {
    return json({ error: 'service_not_configured' }, 503);
  }

  const admin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const jwt = authorization.slice('Bearer '.length);
  const { data: userData, error: userError } = await admin.auth.getUser(jwt);
  if (userError || !userData.user) return json({ error: 'invalid_session' }, 401);

  let payload: { text?: unknown; from?: unknown; to?: unknown };
  try {
    payload = await request.json();
  } catch (_) {
    return json({ error: 'invalid_json' }, 400);
  }
  const text = typeof payload.text === 'string' ? payload.text.trim() : '';
  const from = typeof payload.from === 'string' ? payload.from : '';
  const to = typeof payload.to === 'string' ? payload.to : '';
  if (!text || text.length > 1000 || !supportedLanguages.has(from) || !supportedLanguages.has(to) || from === to) {
    return json({ error: 'invalid_request' }, 400);
  }

  const endpoint = new URL('https://translation.googleapis.com/language/translate/v2');
  endpoint.searchParams.set('key', googleApiKey);
  const providerResponse = await fetch(endpoint, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    // format: 'text' -> düz literal çeviri, hiçbir yorum/parafraz katmıyor.
    body: JSON.stringify({ q: text, source: from, target: to, format: 'text' }),
  });
  if (!providerResponse.ok) {
    console.error('Cloud translation provider failed', providerResponse.status);
    return json({ error: 'provider_unavailable' }, 502);
  }

  const providerData = await providerResponse.json();
  const translated = providerData?.data?.translations?.[0]?.translatedText;
  if (typeof translated !== 'string' || !translated.trim()) {
    return json({ error: 'empty_provider_response' }, 502);
  }

  return json({
    translatedText: decodeHtml(translated.trim()),
    provider: 'google-cloud-translation',
  });
});
