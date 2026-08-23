import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, apikey, content-type, x-client-info',
};

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { ...corsHeaders, 'Content-Type': 'application/json; charset=utf-8' },
  });
}

function base64FromArrayBuffer(buffer: ArrayBuffer): string {
  const bytes = new Uint8Array(buffer);
  let binary = '';
  const chunkSize = 0x8000;
  for (let i = 0; i < bytes.length; i += chunkSize) {
    binary += String.fromCharCode(...bytes.subarray(i, i + chunkSize));
  }
  return btoa(binary);
}

Deno.serve(async (request) => {
  if (request.method === 'OPTIONS') return new Response('ok', { headers: corsHeaders });
  if (request.method !== 'POST') return json({ error: 'method_not_allowed' }, 405);

  const authorization = request.headers.get('Authorization');
  if (!authorization?.startsWith('Bearer ')) return json({ error: 'authentication_required' }, 401);

  const supabaseUrl = Deno.env.get('SUPABASE_URL');
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');
  const elevenLabsApiKey = Deno.env.get('ELEVENLABS_API_KEY');
  const defaultVoiceId = Deno.env.get('ELEVENLABS_VOICE_ID') ?? '21m00Tcm4TlvDq8ikWAM'; // "Rachel" — ElevenLabs varsayılan çok dilli ses
  if (!supabaseUrl || !serviceRoleKey || !elevenLabsApiKey) {
    return json({ error: 'service_not_configured' }, 503);
  }

  const admin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });
  const jwt = authorization.slice('Bearer '.length);
  const { data: userData, error: userError } = await admin.auth.getUser(jwt);
  if (userError || !userData.user) return json({ error: 'invalid_session' }, 401);

  // Premium ses karakter başına ücretli — yalnızca Plus üyeler kullanabilir,
  // aynı chat/translate fonksiyonlarındaki subscriptions kontrolü.
  const { data: subscription } = await admin
    .from('subscriptions')
    .select('status, current_period_end')
    .eq('user_id', userData.user.id)
    .in('status', ['active', 'trialing'])
    .maybeSingle();
  const periodEnd = subscription?.current_period_end
    ? new Date(subscription.current_period_end).getTime()
    : 0;
  if (!subscription || periodEnd <= Date.now()) return json({ error: 'plus_required' }, 403);

  let payload: { text?: unknown; voiceId?: unknown };
  try {
    payload = await request.json();
  } catch (_) {
    return json({ error: 'invalid_json' }, 400);
  }
  const text = typeof payload.text === 'string' ? payload.text.trim() : '';
  const voiceId = typeof payload.voiceId === 'string' && payload.voiceId.length > 0
    ? payload.voiceId
    : defaultVoiceId;
  if (!text || text.length > 400) return json({ error: 'invalid_request' }, 400);

  const endpoint = `https://api.elevenlabs.io/v1/text-to-speech/${voiceId}`;
  const providerResponse = await fetch(endpoint, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
      'xi-api-key': elevenLabsApiKey,
      Accept: 'audio/mpeg',
    },
    body: JSON.stringify({
      text,
      model_id: 'eleven_multilingual_v2',
      voice_settings: { stability: 0.5, similarity_boost: 0.8 },
    }),
  });

  if (!providerResponse.ok) {
    console.error('ElevenLabs TTS failed', providerResponse.status, await providerResponse.text());
    return json({ error: 'provider_unavailable' }, 502);
  }

  const audioBuffer = await providerResponse.arrayBuffer();
  if (audioBuffer.byteLength === 0) return json({ error: 'empty_provider_response' }, 502);

  return json({ audioBase64: base64FromArrayBuffer(audioBuffer), mime: 'audio/mpeg' });
});
