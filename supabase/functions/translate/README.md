# Plus cloud translation Edge Function

This function is the server-side boundary for Plus-only translation. It:

- validates the caller's Supabase JWT;
- verifies an active/trialing row in `public.subscriptions`;
- keeps the Google API key off the Flutter client;
- accepts only VOXELO's 30 languages and up to 1,000 characters;
- forwards no user identity to the translation provider.

## Deploy

```bash
supabase link --project-ref qkhmtmwfwyscvtveiwui
supabase secrets set GOOGLE_TRANSLATE_API_KEY=YOUR_SERVER_SIDE_KEY
supabase functions deploy translate
```

Run `supabase_setup.sql` first. Subscription rows must be maintained by a trusted payment webhook/service-role process; the mobile client has no insert/update policy.
