require 'pg'
require 'sequel'

module Db
  def self.settings
    {
      :hostname => 'aa1uksaja4s8s77.cu9rjfpqkgjk.us-east-1.rds.amazonaws.com',
      :port => 5432,
      :dbname => 'ebdb',
      :username => ENV['PG_USERNAME'],
      :password => ENV['PG_PASSWORD']
    }
  end

  if ENV['RACK_ENV'] == 'production'
    DB = Sequel.connect "postgres://#{Db.settings[:username]}:#{Db.settings[:password]}" \
                        "@#{Db.settings[:hostname]}:#{Db.settings[:port]}/#{Db.settings[:dbname]}"
  else
    DB = Sequel.connect 'mock://postgres'
  end
end

class PullRequest < Sequel::Model(:pull_request)
  def self.create(params)
    # if we pass in params that has this hash format we can just pass in the hash rather than all this craziness
    # like so:
    # PullRequest.insert(params)
    PullRequest.insert(:pull_request_name => params[:pull_request_name], :repo_name => params[:repo_name], :pull_request_link => params[:pull_request_link])
  rescue Sequel::Error => e
    puts "error!: #{e.inspect}"
  end

  def rself.etrieve(repo_name, pull_request_name)
    PullRequest.where(:repo_name => repo_name, :pull_request_name => pull_request_name)
  rescue Sequel::Error => e
    puts "error!: #{e.inspect}"
  end

  def self.delete(params)
    if params.key?(:id)
      PullRequest.where(:id => params[:id]).delete
    else
      PullRequest.where(:repo_name => repo_name, params[:repo_name] => params[:pull_request_name])
    end
  rescue Sequel::Error => e
    puts "error!: #{e.inspect}"
  end
end
