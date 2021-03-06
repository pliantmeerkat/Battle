feature 'Turns are alternated' do
  scenario 'players turn is displayed' do
    sign_in_and_play
    expect(page).to have_content("Jack's turn")
    choose('Power Attack')
  end
  scenario 'Player 2 has a go after player 1' do
    sign_in_and_play
    click_button('Attack')
    click_button('OK')
    expect(page).to_not have_content("Jack's turn")
    expect(page).to have_content("Durain's turn")
    choose('Power Attack')
    click_button('Attack')
    expect(page).to have_content('Attacked Jack')
    click_button('OK')
    expect(page).to_not have_content('Jack hp: 100')
  end
end
