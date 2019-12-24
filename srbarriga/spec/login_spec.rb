describe 'Login', :login do
  before(:each) do
    visit '/login'
  end

  it 'login com sucesso' do
    find('#email').set 'caroline.oliveira@actminds.com'
    find('#senha').set '123456'

    click_button 'Entrar'
    expect(page).to have_content 'Bem vindo, Carol Caracol!'
  end

  it 'email incorreto' do
    find('#email').set 'caroline.oliveira@C.com'
    find('#senha').set '123456'

    click_button 'Entrar'
    expect(page).to have_content 'Problemas com o login do usuário'
  end

  it 'senha incorreta' do
    find('#email').set 'caroline.oliveira@actminds.com'
    find('#senha').set 'test'

    click_button 'Entrar'
    expect(page).to have_content 'Problemas com o login do usuário'
  end

  it 'email não cadastrado' do
  find('#email').set 'manuela.monteiro@actminds.com'
  find('#senha').set '123'

  click_button 'Entrar'
  expect(page).to have_content 'Problemas com o login do usuário'
  end

end