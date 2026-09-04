import { createClient } from 'https://esm.sh/@supabase/supabase-js@2';

// RevenueCat -> public.subscriptions köprüsü. RevenueCat panelinde
// `appUserID`, uygulama tarafında Supabase auth uid'i olarak veriliyor
// (bkz. lib/features/plus/data/revenuecat_billing_service.dart), bu yüzden
// event.app_user_id doğrudan subscriptions.user_id'ye yazılabiliyor.
//
// Bu fonksiyon verify_jwt=false ile deploy edilmeli (RevenueCat kendi paylaşılan
// secret'ını Authorization header'ında gönderiyor, bir Supabase JWT değil).

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body), {
    status,
    headers: { 'Content-Type': 'application/json; charset=utf-8' },
  });
}

const ACTIVE_EVENT_TYPES = new Set([
  'INITIAL_PURCHASE',
  'RENEWAL',
  'UNCANCELLATION',
  'PRODUCT_CHANGE',
  'NON_RENEWING_PURCHASE',
  'SUBSCRIPTION_EXTENDED',
  'TRANSFER',
  'TEMPORARY_ENTITLEMENT_GRANT',
]);

const uuidRe = /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

Deno.serve(async (request) => {
  if (request.method !== 'POST') return json({ error: 'method_not_allowed' }, 405);

  const expectedSecret = Deno.env.get('REVENUECAT_WEBHOOK_SECRET');
  const authorization = request.headers.get('Authorization');
  if (!expectedSecret || authorization !== `Bearer ${expectedSecret}`) {
    return json({ error: 'unauthorized' }, 401);
  }

  const supabaseUrl = Deno.env.get('SUPABASE_URL');
  const serviceRoleKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY');
  if (!supabaseUrl || !serviceRoleKey) return json({ error: 'service_not_configured' }, 503);

  let payload: { event?: Record<string, unknown> };
  try {
    payload = await request.json();
  } catch (_) {
    return json({ error: 'invalid_json' }, 400);
  }

  const event = payload.event;
  if (!event) return json({ error: 'invalid_payload' }, 400);

  const type = String(event.type ?? '');
  if (type === 'TEST') return json({ ok: true, test: true });

  const appUserId = String(event.app_user_id ?? '');
  if (!uuidRe.test(appUserId)) {
    // RevenueCat.configure() öncesi/appUserID verilmeden yapılan eski test
    // satın almaları ya da tanımayamayacağımız bir kimlik — sessizce atla.
    return json({ ok: true, skipped: 'non_uuid_app_user_id' });
  }

  const store = String(event.store ?? 'unknown').toLowerCase();
  const expirationAtMs =
    typeof event.expiration_at_ms === 'number' ? event.expiration_at_ms : null;
  const originalTransactionId = event.original_transaction_id
    ? String(event.original_transaction_id)
    : null;

  // Hangi paket alındığını belirler — RevenueCat panelinde Business için
  // ayrı bir entitlement var (varsayılan kimlik: "business", bkz.
  // lib/features/plus/data/revenuecat_billing_service.dart). Bu event'te
  // hangi entitlement'lar aktifse `entitlement_ids` içinde gelir.
  const entitlementIds = Array.isArray(event.entitlement_ids)
    ? event.entitlement_ids.map((id) => String(id))
    : [];
  const plan = entitlementIds.includes('business') ? 'business' : 'plus';

  let status: 'trialing' | 'active' | 'past_due' | 'canceled' | 'expired';
  if (type === 'EXPIRATION') {
    status = 'expired';
  } else if (type === 'BILLING_ISSUE') {
    status = 'past_due';
  } else if (type === 'CANCELLATION') {
    // Kullanıcı otomatik yenilemeyi kapattı ama dönem bitene kadar erişimi
    // sürüyor — EXPIRATION eventi geldiğinde asıl kapanış işlenecek.
    status = expirationAtMs && expirationAtMs > Date.now() ? 'active' : 'canceled';
  } else if (ACTIVE_EVENT_TYPES.has(type)) {
    status = 'active';
  } else {
    // PAYWALL_* gösterim eventleri, deneyler vb. — subscriptions tablosuyla
    // ilgisiz, yoksay.
    return json({ ok: true, skipped: 'irrelevant_event_type' });
  }

  const admin = createClient(supabaseUrl, serviceRoleKey, {
    auth: { persistSession: false, autoRefreshToken: false },
  });

  const { error } = await admin.from('subscriptions').upsert(
    {
      user_id: appUserId,
      provider: `revenuecat_${store}`,
      provider_customer_id: originalTransactionId,
      status,
      plan,
      current_period_end: expirationAtMs
        ? new Date(expirationAtMs).toISOString()
        : new Date().toISOString(),
      updated_at: new Date().toISOString(),
    },
    { onConflict: 'user_id' },
  );

  if (error) return json({ error: error.message }, 500);
  return json({ ok: true });
});
