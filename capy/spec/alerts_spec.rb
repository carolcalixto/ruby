describe 'Alertas de Java Script', :alerts do
  before(:each) do
    visit '/javascript_alerts'
  end

  it 'alerta' do
    click_button 'Alerta'
    msg = page.driver.browser.switch_to.alert.text # está pedindo para o selenium (capybara usa o selenium) checar o browser e dar um switch da page para o alert e pegar o texto do alert
    expect(msg).to eql 'Isto é uma mensagem de alerta'
    sleep 3
  end

  it 'sim confirma' do
    click_button 'Confirma'
    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content 'Mensagem confirmada'
    sleep 3
  end

  it 'não confirma' do
    click_button 'Confirma'
    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'E ai confirma?'

    page.driver.browser.switch_to.alert.dismiss

    expect(page).to have_content 'Mensagem não confirmada'
    sleep 3
  end

  it 'prompt - maior', :accept_prompt do
    click_button 'Prompt'
    msg = page.driver.browser.switch_to.alert.text
    expect(msg).to eql 'Qual o seu Nome?'
    sleep 2

    page.driver.browser.switch_to.alert.send_keys 'Carol Caracol'
    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content 'Olá, Carol Caracol'
    sleep 3
  end

  it 'prompt - menor - OK', :accept_prompt do
    accept_prompt(with: 'Carol Caracol') do
      click_button 'Prompt'
      sleep 2
    end

    expect(page).to have_content 'Olá, Carol Caracol'
  end

  it 'prompt - menor - CANCEL', :dismiss_prompt do
    dismiss_prompt(with: 'Carol Caracol') do
      click_button 'Prompt'
      sleep 2
    end

    expect(page).to have_content 'Olá, null'
    sleep 3
  end
end
