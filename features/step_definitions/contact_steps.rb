# This is the steps file referred to contact feature
# Place your code relative to that feature here

#index steps

#create steps
Dado("que eu esteja logado como administrador") do
  steps %Q{
    Dado que eu esteja na página de cadastro
    Quando eu preencher o formulário com:
    |user[email]|nnmarques97@gmail.com|
    |user[first_name]|Nicholas        |
    |user[last_name] |Marques         |
    |user[password]  |123456          |
    |user[password_confirmation]|123456|
    E clicar no botão "Enviar"
  }
  user = User.last
  user.add_role :admin
end

Dado("que eu esteja na página de contato") do
  visit new_admin_contact_path
end

Entao("ser redirecionado para página de contatos") do
  expect(page.current_path).to eq admin_contacts_path
end

#show steps

#edit steps

#destroy steps
