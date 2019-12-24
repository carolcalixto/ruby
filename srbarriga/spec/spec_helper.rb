require 'capybara'
require 'capybara/rspec'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end


  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL

  config.before(:example) do
    visit 'https://srbarriga.herokuapp.com/login'
    find('#email').set 'caroline.oliveira@actminds.com'
    find('#senha').set '123456'

    click_button 'Entrar'
    expect(page).to have_content 'Bem vindo, Carol Caracol!'
    #page.current_window.resize_to(1680, 1050)
  end

  config.after(:example) do |e| #passando em um exemplo por vez, ou seja, em um cenário por vez
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ', '_') #método gsub faz substring e usando uma expressão regular (regex) que substitui caracter especial (espaço e acento) por nada. O método tr substitui os espaços em branco (primeiro parâmetro) para underline (segundo parâmetro)
    page.save_screenshot('log/' + nome + '.png') if e.exception #tirar um screenshot SOMENTE se tiver uma exceção. Se tirar o 'if e.exception' vai printar todos os cenários
  end

end


Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_max_wait_time = 5 
  config.app_host = 'https://srbarriga.herokuapp.com' 
  
end