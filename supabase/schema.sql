-- Waleed Logs: one table holds every log entry, each row owned by the signed-in user.
create table if not exists public.entries (
  user_id    uuid not null default auth.uid() references auth.users(id) on delete cascade,
  collection text not null,
  id         text not null,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, collection, id)
);

alter table public.entries enable row level security;

create policy "read own entries"   on public.entries for select to authenticated using ((select auth.uid()) = user_id);
create policy "add own entries"    on public.entries for insert to authenticated with check ((select auth.uid()) = user_id);
create policy "change own entries" on public.entries for update to authenticated using ((select auth.uid()) = user_id) with check ((select auth.uid()) = user_id);
create policy "delete own entries" on public.entries for delete to authenticated using ((select auth.uid()) = user_id);

grant select, insert, update, delete on public.entries to authenticated;

-- live sync between devices
alter table public.entries replica identity full;
alter publication supabase_realtime add table public.entries;
