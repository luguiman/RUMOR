#language: pt
#encoding: utf-8

require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "../../", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "../../", "support", "selectors"))
require "xpath"

module CardapioHelpers 
  def login(email, senha)
    visit '/users/sign_in'
    expect(page).to have_text("Email")
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => senha
    click_button "Sign in"
    expect(page).to have_text("Seja bem-vindo, #{email}!")
  end

  def registrar_usuario(email, senha)
    visit '/users/sign_up'
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => senha
    fill_in 'user_password_confirmation', :with => senha
    click_button "Sign up"
    expect(page).to have_text("Seja bem-vindo, #{email}!")
  end

  # Os argumentos devem ser da forma que seu campo de data pede.
  def seleciona_data_hora(ano_inteiro, mes_string, dia_inteiro, hora_inteiro, minuto_inteiro, texto_do_label)
    label = page.find('label', text: texto_do_label)
    id = label['for']
    select ano_inteiro,   from: "#{id}_1i"
    select mes_string,  from: "#{id}_2i"
    select dia_inteiro,    from: "#{id}_3i"
    select hora_inteiro,   from: "#{id}_4i"
    select minuto_inteiro, from: "#{id}_5i"
  end
end
World(CardapioHelpers)

Dado /^que (?:|eu )estou logado como (.+)$/ do |funcao_na_plataforma|
  if funcao_na_plataforma == "gestor"
    email_gestor = 'gestorteste@email.com'
    senha_gestor = 'senha123'

    registrar_usuario email_gestor, senha_gestor

    @gestor = User.find_by(:email => email_gestor)
  end
end


Quando /^(?:|eu )visito a (.+)$/ do |page_name|
  pending
end

Quando /^(?:|eu )clico no botão "([^"]*)"$/ do |value_do_botao|
  if value_do_botao == "Criar Cadápio"
    click_button "Create Menu"
  end
end

Quando /^(?:|eu )clico em "([^"]*)"$/ do |value_do_link|
  expect(page).to have_text(value_do_link)
  click_link value_do_link
end

Quando /^(?:|eu )selecionar (?:|a |o )([^"]*) como "([^"]*)"$/ do |selection_id, option_name|
  pending
end

Dado /^que (?:|eu )adiciono o arquivo de "(.+)"$/  do |string|
  pending
end


E /^que (?:|eu )estou na (.+)$/ do |page_name|
  visit path_to(page_name)
end


E /^(?:|que )(?:|eu )preencho os campos adequadamente.$/ do
  #Data válida: "21 de Novembro de 2018 às 21:32"
  seleciona_data_hora(2018, "November", 21, 21, 31, "Date")
end

Dado /^(?:|que )(?:|eu )preencho os campos inadequadamente.$/ do
  pending
end

Então /^(?:|eu )deveria ver "([^"]*)"$/ do |texto_a_ser_visto|
expect(page).to have_text(texto_a_ser_visto)
end

Então /^(?:|eu )não deveria ver "([^"]*)"$/ do |text|
  pending
end

Então /^(?:|eu )deveria estar na ([^"]*)$/ do |page_name|
  pending
end

Então /^(?:|eu )quero ser redirecionado para ([^"]*)$/ do |page_name|
  pending
end

Então /^(?:|eu )não quero ser redirecionado para ([^"]*)$/ do |page_name|
  pending
end

E /^ao ver um cardápio válido$/ do
  pending
  end

E /^ao ver o cardápio do dia (.+)$/ do |data|
  pending
end

E  /^uma mensagem de erro deve aparecer$/ do
  pending
end

E /^as datas foram carregadas$/ do
  data_do_cardapio = Date.new(2018, 01, 01)
  while(data_do_cardapio.year == 2018)
    Menu.create(date: data_do_cardapio)
    data_do_cardapio = data_do_cardapio.tomorrow
  end
end

E /^o cardápio "(\d+)" está completo$/ do |dia_do_cardapio|
  # É necessário encontrar o id do cardápio do dia desejado
  # Para facilitar, os testes iniciais só envolverão cardápios do mês de novembro
  data_do_cardapio = Date.new(2018, 11, dia_do_cardapio)
  cardapio = Menu.find_by( :date => data_do_cardapio ) 

  cafe_da_manha = Breakfast.new(
  :menu_id => cardapio.id,
  :hot_drinks => "pão de batata",
  :vegetarian_drink => "pão de batata",
  :chocolate_milk => "pão de batata",
  :bread => "pão de batata",
  :vegetarian_bread => "pão de batata",
  :margarine => "pão de batata",
  :vegetarian_margarine => "pão de batata",
  :complement => "pão de batata",
  :vegetarian_complement => "pão de batata",
  :fruit => "pão de batata" )
  cafe_da_manha.save!

  almoco = Lunch.new( 
    :menu_id => cardapio.id, 
    :salad => "Churrasco de Bode", 
    :sauce => "pão de batata",
    :main_course => "pão de batata",
    :garnish => "pão de batata",
    :vegetarian_dish => "pão de batata",
    :accompaniments => "pão de batata",
    :dessert => "pão de batata",
    :juice => "pão de batata")
  almoco.save!

  jantar = Dinner.new( 
    :menu_id => cardapio.id, 
    :salad => "Churrasco de Bode", 
    :sauce => "pão de batata",
    :main_course => "pão de batata",
    :soup => "pão de batata",
    :vegetarian_dish => "pão de batata",
    :accompaniments => "pão de batata",
    :dessert => "pão de batata",
    :juice => "pão de batata")
  jantar.save!
end

Dado /^ao ver um cardápio de (.+)$/ do |opcao|
  pending # Write code here that turns the phrase above into concrete actions
end
