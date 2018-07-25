require 'sinatra'
require "securerandom"
require './lib/player'
require './lib/game'
# Battle
class Battle < Sinatra::Base

  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

  get '/' do
    erb(:index)
  end

  post '/names' do
    $game = Game.new(Player.new(params[:player_1]), Player.new(params[:player_2]))
    redirect '/play'
  end

  get '/attack' do
    @game = $game
    @game.attack(@game.players[1])
    erb(:attack)
  end

  post '/switch-turns' do
    $game.switch_turns
    redirect('/play')
  end

  get '/play' do
    @game = $game
    erb(:play)
  end

  run! if app_file == $PROGRAM_NAME

end
