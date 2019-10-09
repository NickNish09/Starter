# Starter Project Rails
## Api para o projeto UltraStarterProject
- Devise para autenticação do site e para API (Devise Friendly Token)
- Yarn para instalar dependências javascript
- Admin-Scaffold generator para controllers de admin

### Começando no projeto
- Clone o repositório com ``` git clone https://github.com/NickNish09/Starter.git```
- Troque o nome do projeto em ```config/application.rb``` onde está escrito ```module Starter```. Troque o Starter para o nome do seu projeto.
- Troque o nome da database no arquivo ``` database.yml``` mudando todos os "starter_" para "nomedoseuprojeto_".
Exemplo: ```starter_development``` para ``` nomedoseuprojeto_development```
- Gere o banco com ``` rails db:setup```

### Como gerar scaffolds de admin com bootstrap:
``` rails g admin:scaffold_controller Post title:string content:text published:boolean --bootstrap```
