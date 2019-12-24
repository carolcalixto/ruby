describe 'Adicionar Conta', :conta, :addconta do

  before(:each) do
    visit '/addConta'
  end

  it 'adicionar nova conta' do 
    find('#nome').set 'Aluguel da Vila'
    click_button 'Salvar'

    expect(page).to have_content 'Conta adicionada com sucesso!'
  end
  
  it 'adicionar conta já existente' do 
    find('#nome').set 'Aluguel da Vila'
    click_button 'Salvar'

    expect(page).to have_content 'Já existe uma conta com esse nome'
  end

  it 'adicionar conta sem nome' do 
    find('#nome').set ''
    click_button 'Salvar'

    expect(page).to have_content 'Informe o nome da conta'
  end

end

describe 'Editar Conta', :conta, :editconta do

  before(:each) do
    visit '/contas'
  end

  it 'editar e salvar', :edit do 
    conta = find('table tbody tr', text: 'Aluguel da Vila')
    conta.find('a[href*=editarConta]').click 
    
    find('#nome').set 'Aluguel da Vila 123'
    click_button 'Salvar'

    expect(page).to have_content 'Conta alterada com sucesso!'
  end
  
  it 'editar sem salvar' do 
    conta = find('table tbody tr', text: 'Aluguel da Vila 123')
    conta.find('a[href*=editarConta]').click 

    click_button 'Salvar'

    expect(page).to have_content 'Conta alterada com sucesso!'
  end

  it 'editar nome em branco' do 
    conta = find('table tbody tr', text: 'Aluguel da Vila 123')
    conta.find('a[href*=editarConta]').click 

    find('#nome').set ''
    click_button 'Salvar'

    expect(page).to have_content 'Informe o nome da conta'
  end

end

describe 'Remover Conta', :conta, :removeconta do

  before(:each) do
    visit '/contas'
  end

  it 'remover conta com sucesso' do
    conta = find('table tbody tr', text: 'Aluguel da Vila 123')
    conta.find('a[href*=removerConta]').click 

    expect(page).to have_content 'Conta removida com sucesso!'
  end

end