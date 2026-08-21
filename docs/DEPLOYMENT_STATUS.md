# NURA Deployment Status — 21 Ağustos 2026

## Supabase

Project ref: `qkhmtmwfwyscvtveiwui`  
Region: `ap-northeast-1`  
Project status during deployment: `ACTIVE_HEALTHY`

### Applied database objects

`supabase_setup.sql` was applied successfully through the Supabase Management API.

Tables:

- `profiles`
- `subscriptions`
- `xp_events`
- `leaderboard`
- `family_profiles`
- `clans`
- `clan_members`
- `clan_xp`

RPC functions:

- `delete_my_account`
- `record_xp`
- `get_weekly_leaderboard`
- `create_clan`
- `join_clan`
- `leave_clan`
- `get_my_clan`

Row Level Security is enabled on every application table. Clan tables intentionally expose no direct table policy and are accessed through authenticated, security-definer RPC functions.

### Edge Functions

- `translate`: deployed, status `ACTIVE`, version 1

The function currently has no production Google Translation secret because external services were intentionally kept in test mode. Set `GOOGLE_TRANSLATE_API_KEY` before enabling Plus cloud translation in production.

## Advertising

AdMob remains on Google's official test App IDs and ad-unit IDs. Replace them only before a signed store release.

## Secret handling

No Personal Access Token, GitHub token, service-role key, database password, or provider secret is committed to this repository or included in source archives.
