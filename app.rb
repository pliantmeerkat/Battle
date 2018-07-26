require 'sinatra'
require "securerandom"
require './lib/player'
require './lib/game'
# Battle
class Battle < Sinatra::Base

  before do
    @game = Game.instance
  end

  enable :sessions
  set :session_secret, ENV.fetch('SESSION_SECRET') { SecureRandom.hex(64) }

  get '/' do
    erb(:index)
  end

  post '/names' do
    player_1 = Player.new(params[:player_1])
    player_2 = Player.new(params[:player_2])
    @game = Game.create(player_1, player_2)
    redirect '/play'
  end

  get '/attack' do
    @game.attack
    redirect '/winner' if @game.game_over? == true
    erb(:attack)
    
  end

  get '/winner' do
    @game.winner
    erb(:winner)
  end

  post '/switchturns' do
    @game.switch_turns
    redirect('/play')
  end

  get '/play' do
    erb(:play)
  end

  run! if app_file == $PROGRAM_NAME

end
