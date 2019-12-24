describe 'Upload', :upload do

    before(:each) do 
        visit '/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'#método pwd é o método que retorna o caminho do diretório de execução do projeto
        @imagem = Dir.pwd + '/spec/fixtures/gatinho.jpg'
    end

    it 'upload com arquivo texto' do
        attach_file('file-upload', @arquivo) #tô anexando o arquivo (@arquivo) através do elemento file upload
        click_button 'Upload'

        div_arquivo = find('#uploaded-file') #buscando pelo id 
        expect(div_arquivo.text).to eql 'arquivo.txt' #checando se o que apresenta na tela após o upload é arquivo.txt no elemento uploaded-file
    end

    it 'upload de imagem' do
        attach_file('file-upload', @imagem) 
        click_button 'Upload'

        #puts Capybara.default_max_wait_time #descobrir o tempo máximo que o Capybara vai aguardar para encontrar o elemento
        #sleep 5 #solução não muito interessante, pois o tempo de renderizar uma imagem na tela pode mudar, e aí não fica muito prático ter que alterar nos testes já criados
        
        img = find('#new-image') 
        expect(img[:src]).to include '/uploads/gatinho.jpg' 
    end

    after(:each) do
        sleep 3
    end

end