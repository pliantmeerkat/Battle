# web helpers
def sign_in_and_play
  visit '/'
  fill_in 'player_1',	with: 'Jack'
  fill_in 'player_2',	with: 'Durain'
  click_button 'Play!'
  visit '/play'
end
