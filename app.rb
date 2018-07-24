require 'sinatra'
# Battle
class Battle < Sinatra::Base
  get '/' do
    'Battle'
  end
  run! if app_file == $PROGRAM_NAME
end
