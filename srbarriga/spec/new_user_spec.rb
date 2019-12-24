describe 'Novo usuário', :new do

  before(:each) do
    visit '/cadastro'
  end

  it 'cadastro de usuário com sucesso' do #VERIFICAR ESTE CASO TB, POIS UMA VEZ QUE O USUÁRIO JÁ FOI INSERIDO NÃO É POSSÍVEL INSERIR COM EMAIL IGUAL
    find('#nome').set 'Carol Caracol'
    find('#email').set 'caroline.oliveira@actminds.com'
    find('#senha').set '123456'
    
    click_button 'Cadastrar'

    expect(page).to have_content 'Usuário inserido com sucesso'
  end

  it 'cadastro com email já utilizado' do
    find('#nome').set 'Carol Caracol'
    find('#email').set 'caroline.oliveira@actminds.com'
    find('#senha').set '123456'
    
    click_button 'Cadastrar'
    
    expect(page).to have_content 'Endereço de email já utilizado'
  end

  # it 'cadastro com email inválido', :invalid do
  #   find('#nome').set 'Carol Caracol'
  #   find('#email').set 'caroline.oliveira'
  #   find('#senha').set '123456'

  #   click_button 'Cadastrar'

  #   expect(page).to have_content 'Please include an '

    
  #   #"Please include an '@' in the email address. 'caroline.oliveira' is missing an '@'."
    
  # end


  it 'cadastro de usuário sem nome' do
    find('#nome').set ''
    find('#email').set 'caroline.oliveira@actminds.com'
    find('#senha').set '123456'

    click_button 'Cadastrar'

    expect(page).to have_content 'Nome é um campo obrigatório'
  end

  it 'cadastro de usuário sem email' do
    find('#nome').set 'Carol Caracol'
    find('#email').set ''
    find('#senha').set '123456'

    click_button 'Cadastrar'

    expect(page).to have_content 'Email é um campo obrigatório'
  end

  it 'cadastro de usuário sem senha' do
    find('#nome').set 'Carol Caracol'
    find('#email').set 'caroline.oliveira@actminds.com'
    find('#senha').set ''

    click_button 'Cadastrar'

    expect(page).to have_content 'Senha é um campo obrigatório'
  end

end