feature 'Attacking Players' do
  before(:each) do 
    sign_in_and_play
    click_button('Attack')
  end
  scenario 'Player 1 can attack Player 2' do
    expect(page).to have_content('Jack attacked Durain')
  end
  scenario 'Player 1 damages Player 2' do
    click_link('OK')
    expect(page).not_to have_content 'Durain hp: 100'
    expect(page).to have_content 'Durain hp: 90'
  end
  scenario 'Player 2 can attack Player 1' do

  end
  scenario 'Player 2 damages Player 1' do

  end
end
