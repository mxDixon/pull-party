require 'sinatra'
require_relative 'pull_request'

class App < Sinatra::Base
  post '/pullrequest/' do
    params = JSON.parse(request.body.read, :symbolize_names => true)
    puts "params is #{params}"
    PullRequest.create(params).to_json
  end

  get '/pullrequest/:repo_name/:pull_request_name' do
    pr = PullRequest.retrieve(params['repo_name'], params['pull_request_name'])
    pr.to_hash.to_json
  end

  post '/github_listener' do
      # create record for pull request if that's the notify
      # if it's clsoe, update teh record to closed and notify
      # else, ignore notify
  end
end
