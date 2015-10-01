require 'sinatra'
require_relative 'pull_request'

class App < Sinatra::Base
  post '/pullrequest/' do
    params = request.body.read
    PullRequest.create(params)
  end

  post '/github_listener' do
  end
end
