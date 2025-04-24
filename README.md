# Eighware | Backend API - Ruby on Rails

Este é o backend da aplicação desenvolvido com Ruby on Rails 8.0.1. A autenticação é feita com **Devise** utilizando **JWT**. A API está configurada para ambiente local com banco de dados **SQLite**.

O objetivo deste repositório é fornecer uma estrutura básica para avaliação técnica para testar os conhecimentos full stack, exigindo integração com um backend.

## Requisitos

- Ruby 3.x
- Rails ~> 8.0.1
- Bundler
- SQLite3
- Editor com suporte a Ruby (VSCode recomendado)

## Gems principais

- `devise` – Autenticação
- `devise-jwt` – Integração do Devise com JWT
- `sqlite3` – Banco de dados local
- `puma` – Servidor web
- `rack-cors` – Permitir requisições CORS
- `rspec-rails` – Testes
- `brakeman` – Verificação de segurança
- `rubocop-rails-omakase` – Padrão de código

## Configuração

### 1. Clone o repositório

```bash
https://github.com/DiogooRodrigoo/eightwareBackend.git
```

### 2. Instale as dependências

```bash
bundle install
```

### 3. Configure a chave secreta JWT

A autenticação com Devise + JWT **depende** de uma chave secreta que **você precisa configurar manualmente**. Essa chave é usada para assinar e verificar os tokens de autenticação.

#### Como Configurar

1. Gere a chave segura no seu terminal:

```bash
rails secret
```

2. Edite o arquivo de credenciais:

```bash
#Com VS Code
EDITOR="code --wait" bin/rails credentials:edit

#Com nano (alternativa para ambientes Linux/macOS)
EDITOR="nano" bin/rails credentials:edit

#Sem definir editor (usará o padrão do sistema)
bin/rails credentials:edit
```

3. Adicione a seguinte estrutura:

```bash
devise:
  jwt_secret_key: SUA_CHAVE_AQUI
```

**Importante**: substitua SUA_CHAVE_AQUI pela string gerada.

4. Salve e feche o arquivo para aplicar as mudanças:

```bash
#Com VS Code
`Ctrl + S`, depois feche a janela

#Com nano (alternativa para ambientes Linux/macOS)
`Ctrl + O`, `Enter`, `Ctrl + X`

#Sem definir editor (usará o padrão do sistema)
`Esc`, depois `:wq` e `Enter`
```

Se você não salvar e fechar corretamente, **a chave não será registrada** e o Rails continuará com erro ao tentar autenticar com JWT.

### 4. Prepare o banco de dados:

```bash
bin/rails db:setup
```

### 5. Rode o servidor

Inicie o servidor de desenvolvimento:

```bash
bin/rails server
```

A aplicação estará disponível em: http://localhost:4000

---

Com essas orientações, você conseguirá copiar o repositório, instalar as dependências e rodar o **Projeto Back-end** no seu ambiente local. Caso precise de mais assistência, não hesite em me procurar.

Desenvolvido por Diogo Rodrigo Pedreira Galvão, 2025. Todos os direitos de uso de imagem e atribuições deste trabalho estão diretamente relacionados à empresa Eightware Technology.
