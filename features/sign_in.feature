#language: pt
#encoding: utf-8

@sign_in
Funcionalidade: sign_in
  Como usuário não autenticado
  Para que eu possa entrar no sistema
  Eu quero realizar meu cadastro

  Cenario:
    Dado que eu esteja na página de cadastro
    Quando eu preencher o formulário com:
    |user[email]|nnmarques97@gmail.com|
    |user[first_name]|Nicholas        |
    |user[last_name] |Marques         |
    |user[password]  |123456          |
    |user[password_confirmation]|123456|
    E clicar no botão "Enviar"
    Entao eu devo ver a mensagem de "Welcome! You have signed up successfully."
    E ser redirecionado para página inicial