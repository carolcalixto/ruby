describe 'Select2', :select2 do

    describe('single', :single) do
        before(:each) do
            visit '/apps/select2/single.html'
        end

        it 'seleciona ator por nome' do
            find('.select2-selection--single').click
            sleep 1 #só pra testar e conferir visualmente se clicou, não é legal colocar sleep no código
            find('.select2-results__option', text: 'Adam Sandler').click
            sleep 5 #só pra testar e conferir visualmente se selecionou, não é legal colocar sleep no código
        end

        it 'busca e clica no ator' do
            find('.select2-selection--single').click
            sleep 1
            find('.select2-search__field').set 'Chris Rock'
            sleep 1
            find('.select2-results__option').click
            sleep 5
        end
    end


    describe('multiple', :multiple) do
        before(:each) do
            visit '/apps/select2/multi.html'
        end


        def selecione(ator) #criando um método para selecionar o ator
            find('.select2-selection--multiple').click
            find('.select2-search__field').set ator
            find('.select2-results__option').click
        end

        it 'seleciona atores' do
            atores = ['Jim Carrey', 'Owen Wilson', 'Kevin James']

            atores.each do |a|
                selecione(a)
            end
            sleep 5          
        end


        def deselecione(ator) #criando um método para deselecionar o ator
            find('.select2-selection__choice__remove').click #clicar no X do campo
        end

        it 'deseleciona atores' do
            atores = ['Owen Wilson', 'Kevin James']

            atores.each do |a|
                selecione(a)
                sleep 5 
                deselecione(a)
                sleep 5 
            end
        end
    end

end