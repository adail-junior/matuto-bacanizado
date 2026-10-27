# Matuto Bacanizado · Colocar o site no ar

Três serviços gratuitos, nesta ordem:

| Serviço | Para que serve |
| --- | --- |
| **Supabase** | Guarda produtos, preços, contatos e fotos, e faz o login do Painel do dono |
| **GitHub** | Guarda os arquivos do site |
| **Vercel** | Coloca o site no ar e liga ao matutobacanizado.com.br |

---

## PARTE 1 · Supabase (banco de dados e fotos)

**1. Criar a conta**
Abra https://supabase.com/dashboard/sign-up e entre com a sua conta do GitHub (a mesma do site de Solicitação de Compra).

**2. Criar o projeto**
- Clique em **New project**.
- **Name:** `matuto-bacanizado`
- **Database Password:** crie uma senha e guarde. Não vai usar no dia a dia.
- **Region:** South America (São Paulo).
- Clique em **Create new project** e espere uns 2 minutos.

**3. Criar a estrutura (SQL)**
- No menu da esquerda, clique em **SQL Editor**.
- Abra o arquivo `supabase.sql` (Bloco de Notas), copie tudo e cole no editor.
- Clique em **Run**. Deve aparecer *Success. No rows returned*.

**4. Criar o login do dono**
- Menu da esquerda: **Authentication** → **Users** → **Add user** → **Create new user**.
- **Email:** `omatutobacanizado@hotmail.com` (tem que ser esse, é o que o `supabase.sql` libera pra salvar).
- **Password:** a senha que você vai usar no Painel do dono.
- Marque **Auto Confirm User** e clique em **Create user**.

**5. Fechar novos cadastros (segurança)**
**Authentication** → **Sign In / Providers** → desligue **Allow new users to sign up** → **Save**.

**6. Copiar o endereço e a chave**
- Clique no botão **Connect** no topo do projeto. Copie a **Project URL** (ex.: `https://abcdefghijkl.supabase.co`) e a **publishable key** (começa com `sb_publishable_`).
- A chave também fica em **Settings** → **API Keys**. Use a *publishable* (ou a *anon public*). **Nunca** use a *secret* / *service_role*.

---

## PARTE 2 · Preparar os arquivos

**7. `config.js`**
Já vem preenchido com o projeto da marca (`https://cgxlroxverywdhtqvwgs.supabase.co`). Não precisa mexer.

---

## PARTE 3 · GitHub (arquivos do site)

**8. Criar o repositório e subir os arquivos**
- Abra https://github.com/new
- **Repository name:** `matuto-bacanizado` → **Create repository**.
- Na tela seguinte, clique no link **uploading an existing file**.
- Arraste **tudo que está dentro** da pasta `matuto-bacanizado` (o `index.html`, o `config.js`, as pastas `img` e `fotos` e os outros arquivos). O `index.html` tem que ficar na raiz, não dentro de outra pasta.
- Clique em **Commit changes**.

---

## PARTE 4 · Vercel (site no ar)

**9. Publicar**
- Abra https://vercel.com/new
- Em **Import Git Repository**, escolha `matuto-bacanizado` → **Import**.
- **Framework Preset:** Other. Não mexa no resto → **Deploy**.
- Em menos de 1 minuto aparece o endereço, algo como `matuto-bacanizado.vercel.app`.

**10. Testar o Painel do dono**
- Abra o endereço da Vercel, desça até o rodapé e clique em **Área do dono**.
- Entre com o e-mail e a senha do passo 4. O botão **Painel do dono** aparece.
- Mude algo pequeno (ex.: o horário de atendimento) → **Salvar alterações**. Abra o site numa janela anônima e confira.

---

## PARTE 5 · Domínio matutobacanizado.com.br

**11. Adicionar o domínio na Vercel**
- No projeto da Vercel: **Settings** → **Domains** → **Add Domain** → digite `matutobacanizado.com.br` → **Add**.
- Aceite também o `www.matutobacanizado.com.br` (com redirecionamento).
- A Vercel mostra os registros pra configurar. Anote:
  - **Tipo A**, nome `@`, valor **`76.76.21.21`** (ou o valor que aparecer na tela, se for diferente)
  - **Tipo CNAME**, nome `www`, valor que aparecer na tela (ex.: `cname.vercel-dns.com` ou um código seu)

**12. Apontar no Registro.br**
- Abra https://registro.br/painel/ → clique em **matutobacanizado.com.br**.
- Em **DNS**, clique em **Configurar endereçamento**.
- **Apague** o que está em *Endereço do site* (o redirecionamento para o Claude).
- Clique em **MODO AVANÇADO** → **Nova entrada**:
  - Tipo **A** · Nome: deixe em branco · Dados: `76.76.21.21` (o valor da Vercel)
- **Nova entrada** de novo:
  - Tipo **CNAME** · Nome: `www` · Dados: o valor da Vercel
- **Salvar alterações**.

**13. Conferir**
Volte em **Vercel → Settings → Domains**. Em minutos ou poucas horas aparece **Valid Configuration**, e o https é ativado sozinho. Pronto: matutobacanizado.com.br abre o site novo.

---

## Depois que estiver no ar

- **Preços, produtos, fotos, contatos, guia de medidas, legenda do banner:** pelo **Painel do dono** (rodapé → Área do dono). Vale na hora, pra todo mundo.
- **Mudanças de visual ou novas funções:** o Claude te manda um `index.html` novo. No GitHub, abra o repositório → **Add file** → **Upload files** → arraste o arquivo → **Commit changes**. A Vercel publica sozinha em 1 minuto.
- **Catálogo pra bio e grupos:** `https://matutobacanizado.com.br/#catalogo`
- **Manifesto:** `https://matutobacanizado.com.br/#manifesto-completo`
