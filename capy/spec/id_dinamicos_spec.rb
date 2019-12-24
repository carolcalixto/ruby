describe 'IDs Dinâmicos', :ids_d do 

  before(:each) do
    visit '/access'
  end

  it 'cadastro - que funciona, mas com id dinâmico' do
    find('#PortalTheme_wt10_block_wtcontent_holder_wt8_wtUsernameInput').set 'carol'
    find('#PasswordInput_wt11_PortalTheme_wt7_block_wtcontent_holder_wt8_wt').set '123'
    find('#PortalTheme_wt4_block_wtGetStartedButton_wtcontent_holder_OSCore_wt3_block').click

    expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    sleep 3

  end

  it 'cadastro - que funciona, porém melhor construído com parte do id dinâmico' do #seletor usando expressão regular
    find('input[id$=UsernameInput]').set 'carol'            #o $ significa que irá buscar o id que termine com o UsernameInput
    find('input[id^=PasswordInput]').set '123'              #o ^ significa que irá buscar o id que comece com o PasswordInput
    find('a[id*=GetStartedButton]').click                   #o * significa que irá buscar o id que contém GetStartedButton

    expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    sleep 3

  end

end