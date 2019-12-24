describe 'Botões de Rádio', :radio do
    before(:each) do
        visit '/radios'
    end

    it 'selecionando por id' do
        choose('cap')
    end

    it 'selecionando por find e seletor css' do
        find('input[value=guardians]').click
    end


    after(:each) do
        sleep 3
    end


end