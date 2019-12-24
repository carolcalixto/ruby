
#arquivo criado a partir do init do rspec (rspec --init)
require 'capybara' #importando capybara
require 'capybara/rspec' #importando capybara para trabalhar com rspec

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include Capybara::DSL #a partir deste comando o rspec reconhece todos os recursos do Capybara

  config.before(:example) do
    #page.current_window.resize_to(1280, 800) #redimensionar a resolução da janela aberta --sempre trabalhar com resolução baixa, pois geralmente pcs de usuário final tem resoluções piores
    page.current_window.resize_to(1680, 1050)
  end

  config.after(:example) do |e| #passando em um exemplo por vez, ou seja, em um cenário por vez
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ', '_') #método gsub faz substring e usando uma expressão regular (regex) que substitui caracter especial (espaço e acento) por nada. O método tr substitui os espaços em branco (primeiro parâmetro) para underline (segundo parâmetro)
    page.save_screenshot('log/' + nome + '.png') if e.exception #tirar um screenshot SOMENTE se tiver uma exceção. Se tirar o 'if e.exception' vai printar todos os cenários
  end

end

Capybara.configure do |config| #configurando o driver do Capybara
  config.default_driver = :selenium_chrome_headless #:selenium_chrome = definindo que irá ser trabalhado com o navegador Chrome | :selenium = Firefox | se quiser usar o browser headless é só setar como :selenium_chrome_headless
  config.default_max_wait_time = 5 #definindo tempo de espera padrão de até 5 segundos para encontrar um elemento. Se achar o elemento em menos tempo não irá parar obrigatoriamente este tempo. Melhor performance
  config.app_host = 'https://training-wheels-protocol.herokuapp.com' #definindo uma URL padrão, e nos scripts sempre vai pegar essa URL e completar com as rotas de cada script
end