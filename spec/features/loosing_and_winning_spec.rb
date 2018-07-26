feature 'Winning a game' do
  context 'when player 1 reahes 0hp first' do
    before(:each) do
      sign_in_and_play
      attack_and_confirm
    end
    scenario 'player 1 wins a game' do
      expect(page).to have_content('Durain hp: 10')
      expect(page).to have_content('Jack hp: 10')
      click_button('Attack')
      expect(page).to have_content('Jack is the winner!')
    end
    scenario 'player 2 looses a game' do
      expect(page).to have_content('Durain hp: 10')
      expect(page).to have_content('Jack hp: 10')
      click_button('Attack')
      expect(page).to have_content('Durain has been defeated')
    end
  end
  scenario 'player 2 wins a game' do

  end
  scenario 'player 1 looses a game' do

  end
end
