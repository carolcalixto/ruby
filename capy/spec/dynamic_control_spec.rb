describe 'Dynamic Control', :dc do

    before(:each) do 
        visit '/dynamic_controls'

    end

    it 'quando habilita o campo' do

        # quando tem a propriedade disabled true o campo está desabilitado
        # quando não tem a propriedade disabled true o campo está habilitado

        resultado = page.has_field? 'movie', disabled: true #tô perguntando se existe um campo com identificador = movie e com a propriedade disabled = true
        puts resultado

        click_button 'Habilita'

        resultado = page.has_field? 'movie', disabled: false #tô perguntando se existe um campo com identificador = movie e com a propriedade disabled = true
        puts resultado

    end


end