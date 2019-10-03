#language: pt
#encoding: utf-8

@contact
Funcionalidade: contact
  Como administrador
  Para que eu crie a seção de contato
  Eu quero ter acesso ao formulário de contato e criar o contato.

  Cenario de Fundo:
    Dado que eu esteja logado como administrador
  #index
  Cenário: Listar todos os contacts

  #create
  Cenário: Criar um contato
    Dado que eu esteja na página de contato
    Quando eu preencher o formulário com:
    |contact[name]|CJR|
    |contact[email]|contato@cjr.org.br|
    |contact[phone]|(61)99999-9999    |
    E clicar no botão "Create Contact"
    Entao eu devo ver a mensagem de "Contact was successfully created."
    E ser redirecionado para página de contatos
  #show
  Cenário: Mostrar um contact

  #edit
  Cenário: Editar um contact

  #destroy
  Cenário: Deletar um contact
