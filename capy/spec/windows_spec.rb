describe 'Alternando Janela', :windows do
  before(:each) do
    visit '/windows'
  end

  it 'nova janela' do
    nova_janela = window_opened_by { click_link 'Clique aqui' } # nova_janela é a variável pra guardar a página que foi aberta devido ao click no botão

    within_window -> { page.title == 'Nova Janela' } do # pra verificar o título da página nova
      expect(page).to have_content 'Aqui temos uma nova janela \o/'
    end

    nova_janela.close # fechando a janela do navegador que foi aberta previamente
    expect(nova_janela.closed?).to be true # perguntando se a janela está de fato fechada. Se for true é porque fechou a janela

    sleep 3
  end
end
