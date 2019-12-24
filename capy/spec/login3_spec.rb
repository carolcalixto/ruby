
describe 'Login 3 - Access', :login3 do

    before(:each) do
        visit '/access'
    end

    it 'login com sucesso - com escopo 1' do

        login_form = find('#login') # vai fazer entrar em um escopo e a busca não vai ser ambígua, vai buscar os elementos username e password dentro do escopo que tem id=login

        login_form.find('input[name=username]').set 'stark'
        login_form.find('input[name=password]').set 'jarvis!'
        
        click_button 'Entrar'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'login com sucesso - com escopo 2 - com within' do

        within('#login') do
            find('input[name=username]').set 'stark'
            find('input[name=password]').set 'jarvis!'
            click_button 'Entrar'
        end
        
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

    it 'cadastro com sucesso' do
        
        within('#signup') do
            find('input[name=username]').set 'tonynho'
            find('input[name=password]').set 'jarvis!123'
            find('.btn-primary').click # ou click_link 'Criar Conta'
            sleep 3
        end

        expect(find('#result')).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end

end