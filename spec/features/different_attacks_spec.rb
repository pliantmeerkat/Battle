feature 'Multiple moves' do
  before(:each) { sign_in_and_play }
  scenario 'Power attack' do
    expect(page).to have_field('Power Attack')
    choose('Power Attack')
  end
  scenario 'Fast attack' do
    expect(page).to have_field('Swift Attack')
    choose('Swift Attack')
  end
  scenario 'Ranged attack' do
    expect(page).to have_field('Ranged Attack')
    choose('Ranged Attack')
  end
  scenario 'Defensive move' do
    expect(page).to have_field('Defensive Move')
    choose('Defensive Move')
  end
end
