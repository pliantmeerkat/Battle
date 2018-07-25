feature 'Player Name Entering' do
  scenario 'Submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Jack Vs. Durain'
  end
end
