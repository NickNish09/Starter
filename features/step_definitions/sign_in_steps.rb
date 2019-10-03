# This is the steps file referred to sign_in feature
# Place your code relative to that feature here

Dado("que eu esteja na página de cadastro") do
  visit new_user_registration_path
end

Quando("eu preencher o formulário com:") do |table|
  # table is a Cucumber::MultilineArgument::DataTable

  table.rows_hash.each do |field,value|
    fill_in field, with: value
  end
end

Quando("clicar no botão {string}") do |btn|
  click_on btn
end

Entao("eu devo ver a mensagem de {string}") do |message|
  expect(page).to have_content message
end

Entao("ser redirecionado para página inicial") do
  expect(page.current_path).to eq root_path
end
