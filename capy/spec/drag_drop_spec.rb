describe 'Drag and Drop', :dd do

    before(:each) do
        visit '/drag_and_drop'
    end

    it 'Homem Aranha pertence ao time do Stark' do
        stark = find('.team-stark .column') #entrando na div que é draggable
        cap = find('.team-cap .column')

        spiderman = find('img[alt$=Aranha]') #dando drag no elemento
        spiderman.drag_to stark #dando drop no elemento

        sleep 5

        #verificando se a imagem do spiderman foi movida mesmo do cap para o stark
        expect(stark).to have_css 'img[alt$=Aranha]' #passando o css selector que pertence à imagem do Homem Aranha pra checar se ele está na div do Tony Stark
        expect(cap).not_to have_css 'img[alt$=Aranha]' #passando o css selector que pertence à iamgem do Homem Aranha pra checar se ele saiu da div do Capitão América
        
    end
    
end
