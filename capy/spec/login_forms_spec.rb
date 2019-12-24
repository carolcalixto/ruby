
describe 'Forms', :forms do
    it 'login com sucesso' do
        visit '/login'
        #através do fill in é possível pegar o valor dos elementos pelos atributos name e Id
        #fill_in 'username', with: 'stark' #trabalhando com o atributo name
        #fill_in 'password', with: 'jarvis!' #trabalhando com o atributo name
        fill_in 'userId', with: 'stark' #trabalhando com o atributo id
        fill_in 'passId', with: 'jarvis!' #trabalhando com o atributo id

        click_button 'Login'

        expect(find('#flash').visible?).to be true #checando se o elemento com id=flash é visível. Se retornar true no console é porque ele é visível

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!' #obtendo o texto e verificando se a string contém no texto
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!' #verificando se no elemento contém a string

        #page.save_screenshot('log/login_com_sucesso.png') #tirar screenshot depois dois testes. A pasta log foi criada no momento de rodar esta suíte. Colocando assim será tirado screenshot por cenário

    end

    it 'senha incorreta' do
        visit '/login'
        fill_in 'username', with: 'stark' #trabalhando com o atributo name
        fill_in 'password', with: 'jarvis!123' #trabalhando com o atributo name

        click_button 'Login'

        expect(find('#flash').visible?).to be true #checando se o elemento com id=flash é visível. Se retornar true no console é porque ele é visível

        expect(find('#flash')).to have_content 'Senha é invalida!' #verificando se no elemento contém 

        #page.save_screenshot('log/login_com_senha_incorreta.png')
    end

    it 'usuário não cadastrado' do
        visit '/login'
        fill_in 'username', with: 'stark123' #trabalhando com o atributo name
        fill_in 'password', with: 'jarvis!' #trabalhando com o atributo name

        click_button 'Login'

        expect(find('#flash').visible?).to be true #checando se o elemento com id=flash é visível. Se retornar true no console é porque ele é visível

        expect(find('#flash')).to have_content 'O usuário informado não está cadastrado!' #verificando se no elemento contém 

        #page.save_screenshot('log/usuario_nao_cadastrado.png')
    end

    after(:each) do |e| #vai pegar as propriedades de cada cenário que está sendo executado
        nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ', '_') #método gsub faz substring e usando uma expressão regular (regex) que substitui caracter especial (espaço e acento) por nada. O método tr substitui os espaços em branco (primeiro parâmetro) para underline (segundo parâmetro)
        page.save_screenshot('log/' + nome + '.png')
    end
    
end