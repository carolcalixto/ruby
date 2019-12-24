describe 'Meu primeiro script', :hello do

    before(:each) do
        page.current_window.resize_to(1280, 800) #redimensionar a resolução da janela aberta --sempre trabalhar com resolução baixa, pois geralmente pcs de usuário final tem resoluções piores
    end
    
    it 'Visitar a página' do
        visit '/'
        expect(page.title).to eql 'Training Wheels Protocol'

    end
end