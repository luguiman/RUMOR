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

  def seleciona_arquivo(nome_arquivo)
    page.attach_file('menu[file]', 'vendor/Agosto 2018 - OFICIAL.xlsx')
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
  case value_do_botao
    when "Criar Cardápio"
      click_button "Create Menu"
    when "Criar Desjejum"
      click_button "Create Breakfast"
    when "Criar Almoço"
      click_button "Create Lunch"
    when "Criar Jantar"
      click_button "Create Dinner"
    when "Atualizar Cardápio"
      click_button "Update Menu"
    when "Atualizar Desjejum"
      click_button "Update Breakfast"
    when "Atualizar Almoço"
      click_button "Update Lunch"
    when "Atualizar Jantar"
      click_button "Update Dinner"
    when "Importar Cardápio"
      click_button "Importar Cardápio"
    else 
      pending
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
  seleciona_arquivo(string)
end


E /^que (?:|eu )estou na (.+)$/ do |page_name|
  visit path_to(page_name)
end


E /^(?:|que )(?:|eu )preencho os campos de "(.+)" adequadamente$/ do |tipo_de_campo|
  case tipo_de_campo
  when "datas"
    #Data válida: "21 de Novembro de 2018 às 21:32"
    seleciona_data_hora(2018, "November", 21, 21, 31, "Date")
  when "desjejum"
    fill_in "breakfast_hot_drinks", with: 'Chiclete de batata'
    fill_in "breakfast_vegetarian_drink", with: 'Chiclete de batata'
    fill_in "breakfast_chocolate_milk", with: 'Chiclete de batata'
    fill_in "breakfast_bread", with: 'Chiclete de batata'
    fill_in "breakfast_vegetarian_bread", with: 'Chiclete de batata'
    fill_in "breakfast_margarine", with: 'Chiclete de batata'
    fill_in "breakfast_vegetarian_margarine", with: 'Chiclete de batata'
    fill_in "breakfast_complement", with: 'Chiclete de batata'
    fill_in "breakfast_vegetarian_complement", with: 'Chiclete de batata'
    fill_in "breakfast_fruit", with: 'Chiclete de batata'
  when "almoço"
    fill_in "lunch_salad", with: 'bife de banana'
    fill_in "lunch_sauce", with: 'bife de banana'
    fill_in "lunch_main_course", with: 'bife de banana'
    fill_in "lunch_garnish", with: 'bife de banana'
    fill_in "lunch_vegetarian_dish", with: 'bife de banana'
    fill_in "lunch_accompaniments", with: 'bife de banana'
    fill_in "lunch_dessert", with: 'bife de banana'
    fill_in "lunch_juice", with: 'bife de banana'
  when "jantar"
    fill_in "dinner_salad", with: 'Chiclete de pepino'
    fill_in "dinner_sauce", with: 'Chiclete de pepino'
    fill_in "dinner_soup", with: 'Chiclete de pepino'
    fill_in "dinner_main_course", with: 'Chiclete de pepino'
    fill_in "dinner_vegetarian_dish", with: 'Chiclete de pepino'
    fill_in "dinner_accompaniments", with: 'Chiclete de pepino'
    fill_in "dinner_dessert", with: 'Chiclete de pepino'
    fill_in "dinner_juice", with: 'Chiclete de pepino'
  else
    pending
  end
end

E /^(?:|que )(?:|eu )espero por (\d+) segundos$/ do |n|
  sleep(n.to_i)
end

Dado /^(?:|que )(?:|eu )preencho os campos inadequadamente.$/ do
  pending
end

Então /^(?:|eu )deveria ver "([^"]*)"$/ do |texto_a_ser_visto|
  expect(page).to have_text(texto_a_ser_visto)
end

Então /^(?:|eu )deveria ver o dia "([^"]*)" do mês atual$/ do |dia_do_mes|
  this_month = Date.today.strftime("%B")
  this_year = Date.today.strftime("%Y")
  expect(page).to have_text("#{dia_do_mes} #{this_month} #{this_year}")
end

Então /^(?:|eu )não deveria ver "([^"]*)"$/ do |text|
  pending
end

Então /^(?:|eu )deveria estar na ([^"]*)$/ do |page_name|
  pending
end

Então /^(?:|eu )quero ser redirecionado para ([^"]*)$/ do |page_name|
  expect(current_path).to eq(path_to(page_name))
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
  this_month_numerically = Date.today.strftime("%m")
  this_year = Date.today.strftime("%Y")
  data_do_cardapio = Date.new(this_year.to_i, this_month_numerically.to_i, dia_do_cardapio.to_s[0,1].to_i)
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
