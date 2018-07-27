feature 'Multiple moves' do
  before(:each) { sign_in_and_play }
  scenario 'Power attack' do
    expect(page).to have_field('Power Attack')
    choose('Power Attack')
    click_button('Attack')
    expect(page).to have_content('Power Attacked')
  end
  scenario 'Fast attack' do
    expect(page).to have_field('Swift Attack')
    choose('Swift Attack')
    click_button('Attack')
    expect(page).to have_content('Swiftly Attack')
  end
  scenario 'Ranged attack' do
    expect(page).to have_field('Ranged Attack')
    choose('Ranged Attack')
    click_button('Attack')
    expect(page).to have_content('Range Attacked')
  end
  scenario 'Defensive move' do
    expect(page).to have_field('Defensive Move')
    choose('Defensive Move')
    click_button('Attack')
    expect(page).to have_content('Defensivley Attacked')
  end
end
