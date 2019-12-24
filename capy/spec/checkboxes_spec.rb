describe 'Caixas de seleção', :checkbox do
    before(:each) do #para todos os cenários (its) vai executar esse código antes, ou seja, vai acessar o link antes
        visit '/checkboxes'
    end

    it 'marcando uma opção' do
        check('thor') #vai checar a opção Thor
    end

    it 'desmarcando uma opção' do
        uncheck('antman')
    end

    it 'marcando com find set true' do #marcando através do seletor css, quando o elemento não tem id nem name
        find('input[value=cap]').set(true)
    end

    it 'desmarcando com find set false' do #desmarcando através do seletor css, quando o elemento não tem id nem name
        find('input[value=guardians]').set(false)
    end

    after(:each) do
        sleep 3
    end

end