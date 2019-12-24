describe 'iFrames', :iframes do

    describe 'bom', :nice_iframe do

        before(:each) do
            visit '/nice_iframe'
        end

        it 'adicionar ao carrinho' do
            within_frame('burgerId') do #o capybara só trabalha com iframe que tenha id ou name
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50'
                sleep 5
                click_link 'Fechar Pedido'
                sleep 5
            end
        end
    end


    describe 'ruim', :bad_iframe do #um iframe ruim é um que não tem ID, precisa pedir para um dev colocar o id (html) para este iframe. Tb da pra inserir um id temporariamente

        before(:each) do
            visit '/bad_iframe'
        end

        it 'carrinho deve estar vazio' do
            script = '$(".box-iframe").attr("id", "tempId");' #a variável script está recebendo um script de jquey como uma string
            page.execute_script(script) #antes de executar o iframe vai inserir o id pra esse iframe

            within_frame('tempId') do 
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
                sleep 3
            end
        end
    end
end