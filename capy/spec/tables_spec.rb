describe 'Tabelas', :tabs do

  before(:each) do
    visit '/tables'
  end

  # it 'pega o Robert Downey Jr na lista' do
  #   expect(page).to have_content 'Robert Downey Jr'
  # end

  it 'exibe o salário do Robert Downey Jr' do
    atores = all('table tbody tr') #vai trazer todos os elementos do table tbody tr (já que tem 5 elementos)
    
    stark = atores.detect { |ator| ator.text.include?('Robert Downey Jr') } #vai percorrer todos os atores da linha de cima e checar se Robert Downey Jr está incluído nesta lista
    
    expect(stark.text).to include '10.000.000' #vai verificar dentro da linha do Robert Downey Jr se existe o valor de 10.000.000'
  end

  it 'exibe o salário do Vin Diesel' do
    diesel = find('table tbody tr', text: '@vindiesel') #vai entrar na linha do Vin Diesel na tabela e vai fazer o comando abaixo. Checar se o salário é 10mi
    expect(diesel).to have_content '10.000.000'
  end

  it 'exibe o filme velozes' do
    diesel = find('table tbody tr', text: '@vindiesel')

    filme = diesel.all('td')[2].text #trazer todas as colunas e pega apenas a posição 2 (que é a coluna filme) e traz o texto desta coluna

    expect(filme).to eql 'Fast & Furiuos' #não vai falhar se estiver escrito assim: 'Velozes e Furiosos'
  end

  it 'exibe o personagem do chris evans' do
    evans = find('table tbody tr', text: '@teamcevans')

    personagem = evans.all('td')[1].text # trazer só o personagem do Capitão América

    expect(personagem).to eql 'Capitão América'
  end

  it 'seleciona o chris pratt para remoção' do
    pratt = find('table tbody tr', text: 'Chris Pratt')
    pratt.find('a', text: 'delete').click
    
    msg = page.driver.browser.switch_to.alert.text # está pedindo para o selenium (capybara usa o selenium) checar o browser e dar um switch da page para o alert e pegar o texto do alert
    expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    sleep 3
  end

  it 'seleciona o chadwick boseman para edição' do
    boseman = find('table tbody tr', text: 'Chadwick Boseman')
    boseman.find('a', text: 'edit').click
    
    msg = page.driver.browser.switch_to.alert.text 
    expect(msg).to eql 'Chadwick Boseman foi selecionado para edição!'
    sleep 3
  end
end

