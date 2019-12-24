
describe 'Login 2 - Dinâmico', :login2 do

    before(:each) do
        visit '/login2'
    end
    it 'login com data de nascimento' do

        find('#userId').set 'stark'
        find('#passId').set 'jarvis!'

        login_form = find('#login') #pegou o Id do form(elemento)

        case login_form.text #fazendo case com o text do login_form
        when /Dia/                      #quando a palavra Dia estiver dentro do login_form.text
            find('#day').set '29'       #escreva 29 no campo para o dia
        when /Mês/                      #quando a palavra Mês estiver dentro do login_form.text
            find('#month').set '05'     #escreva 05 no campo para o mês
        when /Ano/                      #quando a palavra Ano estiver dentro do login_form.text
            find('#year').set '1970'    #escreva 1970 no campo para o mês
        end

        click_button 'Login'
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

end