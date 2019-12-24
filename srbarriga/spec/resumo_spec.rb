describe 'Resumo Mensal', :resume do

  before(:each) do
    visit '/extrato'
  end

  it 'Pesquisar conta de março 2018' do
    select('Março', from: 'mes')
    select('2018', from: 'ano')
    click_button 'Buscar'

    expect(page).to have_content 'Movimentação da conta de março'

  end

  it 'Remover uma movimentação' do 
    select('Abril', from: 'mes')
    select('2019', from: 'ano')
    click_button 'Buscar'

    movimentacao = find('table tbody tr', text: 'Recebimento de aluguel casa 22')
    movimentacao.find('a[href*=removerMovimentacao]').click 
    
    expect(page).to have_content 'Movimentação removida com sucesso!'
  end


end