-- Waleed Logs: one shared table, no sign-in. Anyone with the site can read and write it.
create table if not exists public.logs (
  collection text not null,
  id         text not null,
  data       jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (collection, id)
);

alter table public.logs enable row level security;
create policy "open read"   on public.logs for select to anon, authenticated using (true);
create policy "open add"    on public.logs for insert to anon, authenticated with check (true);
create policy "open change" on public.logs for update to anon, authenticated using (true) with check (true);
create policy "open delete" on public.logs for delete to anon, authenticated using (true);
grant select, insert, update, delete on public.logs to anon, authenticated;

alter table public.logs replica identity full;
alter publication supabase_realtime add table public.logs;
