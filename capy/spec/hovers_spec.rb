describe 'Mouse Hover', :hovers do

    before(:each) do
        visit '/hovers'
    end

    it 'quando passo o mouse sobre o Blade' do
        card = find('img[alt*=Blade]') #o asterisco significa que irá buscar um elemento que CONTÉM Blade
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'quando passo o mouse sobre o Pantera Negra' do
        #card = find('img[alt="Pantera Negra"]') #quando o elemento possui caracter especial ou espaço, deve passar a string através de aspas dentro das aspas
        card = find('img[alt^=Pantera]') #o circunflexo significa que irá buscar um elemento que COMECE com a palavra Pantera
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end

    it 'quando passo o mouse sobre o Homem Aranha' do
        #card = find('img[alt="Homem Aranha"]') #as aspas significa que irá buscar um elemento exatamente com as palavras Homem Aranha
        card = find('img[alt$=Aranha]') #o dólar significa que irá buscar um elemento que TERMINE com a palavra Aranha
        card.hover

        expect(page).to have_content 'Nome: Homem Aranha'
    end

    after(:each) do
        sleep 0.5 # temporário, só para verificar o resultado
    end

end