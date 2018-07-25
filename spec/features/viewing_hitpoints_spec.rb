feature 'hit points' do
  before(:each) { sign_in_and_play }
  scenario 'see player 1 hp' do
    expect(page).to have_content 'Jack hp: 100'
  end
  scenario 'see player 2 hp' do
    expect(page).to have_content 'Durain hp: 100'
  end
end
