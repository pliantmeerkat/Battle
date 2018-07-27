require 'sinatra'
require "securerandom"
require './lib/player'
require './lib/game'
require './lib/damage'
require './lib/attack'
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
    player1 = Player.new(params[:player_1])
    player2 = Player.new(params[:player_2])
    @game = Game.create(player1, player2, Damage, Attack)
    redirect '/play'
  end

  get '/attackchoice' do
    @game.attack_choice = params[:attack_type]
    redirect '/attack'
  end

  get '/attack' do
    @messages = @game.attack
    @attack_type = @game.attack_choice_output
    redirect '/winner' if @game.game_over? == true
    erb(:attack)
  end

  get '/winner' do
    @winner = @game.winner.name
    @looser = @game.looser.name
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
