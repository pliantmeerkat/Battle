feature 'Winning a game' do
  context 'when player 1 reahes 0hp first' do
    before(:each) do
      sign_in_and_play
      visit '/winner'
    end
    scenario 'the winning screen displays correctly' do
      expect(page).to have_content('Game over!')
      expect(page).to have_content('Durain has been defeated')
    end
    scenario 'starts a new game correctly' do
      click_button('Again?')
      expect(page).to have_content('Welcome to battle')
    end
  end
end
