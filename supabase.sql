-- =====================================================================
-- Matuto Bacanizado · estrutura do Supabase
-- Cole tudo no SQL Editor do Supabase e clique em RUN (passo 3).
--
-- Só o e-mail abaixo consegue salvar alterações e enviar fotos.
-- Se for usar outro e-mail no login do dono, troque nas 5 linhas
-- que têm omatutobacanizado@hotmail.com.
-- =====================================================================

-- 1) Tabela com as informações da loja (produtos, preços, contatos...)
create table if not exists public.loja (
  id text primary key,
  dados jsonb not null,
  atualizado_em timestamptz not null default now()
);

alter table public.loja enable row level security;

drop policy if exists "loja_leitura_publica" on public.loja;
create policy "loja_leitura_publica" on public.loja
  for select to anon, authenticated
  using (true);

drop policy if exists "loja_dono_insere" on public.loja;
create policy "loja_dono_insere" on public.loja
  for insert to authenticated
  with check (lower(auth.jwt() ->> 'email') = 'omatutobacanizado@hotmail.com');

drop policy if exists "loja_dono_altera" on public.loja;
create policy "loja_dono_altera" on public.loja
  for update to authenticated
  using (lower(auth.jwt() ->> 'email') = 'omatutobacanizado@hotmail.com')
  with check (lower(auth.jwt() ->> 'email') = 'omatutobacanizado@hotmail.com');

-- 2) Pasta pública de fotos (qualquer visitante vê, só o dono envia)
insert into storage.buckets (id, name, public)
values ('fotos', 'fotos', true)
on conflict (id) do update set public = true;

drop policy if exists "fotos_dono_envia" on storage.objects;
create policy "fotos_dono_envia" on storage.objects
  for insert to authenticated
  with check (bucket_id = 'fotos' and lower(auth.jwt() ->> 'email') = 'omatutobacanizado@hotmail.com');

drop policy if exists "fotos_dono_apaga" on storage.objects;
create policy "fotos_dono_apaga" on storage.objects
  for delete to authenticated
  using (bucket_id = 'fotos' and lower(auth.jwt() ->> 'email') = 'omatutobacanizado@hotmail.com');
