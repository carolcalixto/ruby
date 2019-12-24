describe 'Caixa de opções', :dropdown do
    it 'item específico simples' do
        visit '/dropdown'
        #select('Opção', from: 'Elemento') #sintaxe -- opção é a opção do dropdown e elemento é o id inspecionado do campo
        select('Loki', from: 'dropdown') #essa opção (select) funciona exclusivamente para elementos do tipo select e que possuem ID
        sleep 3 #temporário
    end

    it 'item específico com o find' do
        visit '/dropdown'
        drop = find('.avenger-list') #buscando pela class do elemento através do find
        drop.find('option', text: 'Scott Lang').select_option #o find vai buscar uma opção que tenha Scott Lang como texto e vai guardar o elemento dentro da variável drop
        sleep 3 #temporário
    end

    it 'qualquer item', :sample do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.all('option').sample.select_option #o método all traz um array, por isso deve-se usar um sample. já que o sample é assim: dentro de um array seleciona um valor randômico
        sleep 3
    end

end