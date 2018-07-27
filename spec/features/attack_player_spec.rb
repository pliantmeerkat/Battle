feature 'Attacking Players' do
  before(:each) do
    sign_in_and_play
    choose('Power Attack')
    click_button('Attack')
  end
  scenario 'Player 1 can attack Player 2' do
    expect(page).to have_content('Attacked Durain')
  end
  scenario 'Player 1 damages Player 2' do
    click_button('OK')
    expect(page).to_not have_content 'Durain hp: 100'
    expect(page).to_not have_content 'Durain hp: 100'
  end
  scenario 'Player 2 can attack Player 1' do
    click_button('OK')
    choose('Power Attack')
    click_button('Attack')
    expect(page).to have_content('Attacked Jack')
  end
  scenario 'Player 2 damages Player 1' do
    click_button('OK')
    click_button('Attack')
    click_button('OK')
    expect(page).to_not have_content 'Jack hp: 100'
    expect(page).to_not have_content 'Jack hp: 100'
  end
end
