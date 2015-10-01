require 'pg'
require 'sequel'

<<<<<<< HEAD
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
  def create(params)
    # if we pass in params that has this hash format we can just pass in the hash rather than all this craziness
    # like so:
    # PullRequest.insert(params)
    PullRequest.insert(:pull_request_name => params[:pull_request_name], :repo_name => params[:repo_name], :pull_request_link => params[:pull_request_link])
  rescue Sequel::Error => e
    puts "error!: #{e.inspect}"
  end

  def retrieve(pull_request_name, repo_name)
    PullRequest.where(:pull_request_name => pull_request_name, :repo_name => repo_name)
  rescue Sequel::Error => e
    puts "error!: #{e.inspect}"
  end

  def delete(id)
    PullRequest.where(:id => id).delete
  rescue Sequel::Error => e
    puts "error!: #{e.inspect}"
  end
=======
class PullRequest
    def initialize
    end
>>>>>>> 8b33f927aa47489d77b61939efe074ead6875ccc
end
