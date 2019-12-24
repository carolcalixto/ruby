describe 'Movimentação de Conta', :movim do
  before(:each) do
    visit '/movimentacao'
  end

  it 'receita salva com sucesso', :rec do
    select('Receita', from: 'tipo')
    find('#data_transacao').set '22/04/2019'
    find('#data_pagamento').set '18/04/2019'
    find('#descricao').set 'Recebimento de aluguel casa 22'
    find('#interessado').set 'Carol Caracol'
    find('#valor').set '22.50'
    select('Aluguel', from: 'conta')
    choose('status_pendente')
       
    click_button 'Salvar'

    expect(page).to have_content 'Movimentação adicionada com sucesso!'
  end

  it 'despesa salva com sucesso', :pag do
    select('Despesa', from: 'tipo')
    find('#data_transacao').set '21/04/2019'
    find('#data_pagamento').set '17/04/2019'
    find('#descricao').set 'Pagamento de material'
    find('#interessado').set 'Carol Caracol'
    find('#valor').set '1111.99'
    select('Material', from: 'conta')
    choose('status_pago')
       
    click_button 'Salvar'

    expect(page).to have_content 'Movimentação adicionada com sucesso!'
  end

  it 'data movimentação obrigatória não preenchida', :obrig do
    select('Despesa', from: 'tipo')
    find('#data_transacao').set ''
    find('#data_pagamento').set '17/04/2019'
    find('#descricao').set 'Pagamento de material'
    find('#interessado').set 'Carol Caracol'
    find('#valor').set '1111.99'
    select('Material', from: 'conta')
    choose('status_pago')
       
    click_button 'Salvar'

    expect(page).to have_content 'Data da Movimentação é obrigatório'
  end

  it 'data pagamento obrigatória não preenchida', :obrig do
    select('Despesa', from: 'tipo')
    find('#data_transacao').set '21/04/2019'
    find('#data_pagamento').set ''
    find('#descricao').set 'Pagamento de material'
    find('#interessado').set 'Carol Caracol'
    find('#valor').set '1111.99'
    select('Material', from: 'conta')
    choose('status_pago')
       
    click_button 'Salvar'

    expect(page).to have_content 'Data do pagamento é obrigatório'
  end

  it 'descrição obrigatória não preenchida', :obrig do
    select('Despesa', from: 'tipo')
    find('#data_transacao').set '21/04/2019'
    find('#data_pagamento').set '22/04/2019'
    find('#descricao').set ''
    find('#interessado').set 'Carol Caracol'
    find('#valor').set '1111.99'
    select('Material', from: 'conta')
    choose('status_pago')
       
    click_button 'Salvar'

    expect(page).to have_content 'Descrição é obrigatório'
  end

  it 'interessado obrigatório não preenchido', :obrig do
    select('Despesa', from: 'tipo')
    find('#data_transacao').set '21/04/2019'
    find('#data_pagamento').set '22/04/2019'
    find('#descricao').set 'Pagamento de material'
    find('#interessado').set ''
    find('#valor').set '1111.99'
    select('Material', from: 'conta')
    choose('status_pago')
       
    click_button 'Salvar'

    expect(page).to have_content 'Interessado é obrigatório'
  end

  it 'valor obrigatório não preenchido', :obrig do
    select('Despesa', from: 'tipo')
    find('#data_transacao').set '21/04/2019'
    find('#data_pagamento').set '22/04/2019'
    find('#descricao').set 'Pagamento de material'
    find('#interessado').set 'Carol Caracol'
    find('#valor').set ''
    select('Material', from: 'conta')
    choose('status_pago')
       
    click_button 'Salvar'

    expect(page).to have_content 'Valor é obrigatório'
  end

  it 'data de movimentação inválida', :invalid do
    select('Despesa', from: 'tipo')
    find('#data_transacao').set '21-04-2019'
    find('#data_pagamento').set '17/04/2019'
    find('#descricao').set 'Pagamento de material'
    find('#interessado').set 'Carol Caracol'
    find('#valor').set '1111.99'
    select('Material', from: 'conta')
    choose('status_pago')
       
    click_button 'Salvar'

    expect(page).to have_content 'Data da Movimentação inválida (DD/MM/YYYY)'
  end

  it 'data de pagamento inválida', :invalid do
    select('Despesa', from: 'tipo')
    find('#data_transacao').set '17/04/2019'
    find('#data_pagamento').set '21-04-2019'
    find('#descricao').set 'Pagamento de material'
    find('#interessado').set 'Carol Caracol'
    find('#valor').set '1111.99'
    select('Material', from: 'conta')
    choose('status_pago')
       
    click_button 'Salvar'

    expect(page).to have_content 'Data do pagamento inválida (DD/MM/YYYY)'
  end

  it 'valor inválido', :invalid do
    select('Despesa', from: 'tipo')
    find('#data_transacao').set '17/04/2019'
    find('#data_pagamento').set '21/04/2019'
    find('#descricao').set 'Pagamento de material'
    find('#interessado').set 'Carol Caracol'
    find('#valor').set 'inválido'
    select('Material', from: 'conta')
    choose('status_pago')
       
    click_button 'Salvar'

    expect(page).to have_content 'Valor deve ser um número'
  end


end
