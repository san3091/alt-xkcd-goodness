require 'sinatra'
require 'httparty'

get '/' do
  latest = JSON.parse(HTTParty.get("http://xkcd.com/info.0.json").body)
  max_num = latest['num'].to_i 
  num = rand(max_num)
  response = HTTParty.get("http://xkcd.com/#{num}/info.0.json")
  body = JSON.parse(response.body)
  @quote = body['alt']
  erb :index
end
