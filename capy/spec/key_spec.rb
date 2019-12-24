
describe 'Teclado', :key do

    before(:each) do
        visit '/key_presses'
    end

    it 'enviando teclas' do
        teclas = %i[tab escape space enter shift control alt] #%i para identificar que é um array de símbolos, e passei várias teclas neste array para no find essas teclas serem localizadas

        teclas.each do |t|
            find('#campo-id').send_keys t
            expect(page).to have_content 'You entered: ' + t.to_s.upcase #uppercase porque no array as teclas estão em caixa baixa e no sistema ta em caixa alta, então precisa fazer uppercase pra igualar
            sleep 1
        end      
        
    end

    it 'enviando letras sem array' do
        find('#campo-id').send_keys 'carolcaracol'
        expect(page).to have_content 'You entered: L'
    end

    it 'enviando letras com array' do
        letras = %w[c O m I d A] #%w pra identificar que é um array de strings

        letras.each do |l|
            find('#campo-id').send_keys l
            expect(page).to have_content 'You entered: ' + l.to_s.upcase

            sleep 3
        end
    end
end