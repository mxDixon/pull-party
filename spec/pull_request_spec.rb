require 'rspec'
require 'sequel'
require 'pg'
require_relative '../app/pull_request'

describe PullRequest do
  RSpec.configure do |c|
    c.around(:each) do |example|
      Db::DB.transaction(:rollback=>:always, :auto_savepoint=>true){example.run}
    end
  end
  
  describe 'PullRequest#Insert' do

    context 'It receives no params' do
      it 'puts the sequel error message' do
        PullRequest.insert({})
      end
    end

    context 'It recieves valid params' do
      it 'inserts a new pull request' do
        params = {
                  :pull_request_name => 'My pull request',
                  :repo_name => 'My repo',
                  :pull_request_link => 'https://www.test.com/my_pull_request'
                 }
        PullRequest.insert(params)
      end
    end
  end

  describe 'PullRequest#Retrieve' do
    before :each do
        params = {
          :pull_request_name => 'My pull request',
          :repo_name => 'My repo',
          :pull_request_link => 'https://www.test.com/my_pull_request'
        }
        PullRequest.create(params)
    end
    context 'It recieves bad arguments' do
      it 'puts the sequel error message when the pull_request_name is nil' do
        pull_request = PullRequest.retrieve(nil, 'My repo')
      end
      it 'puts the sequel error message when the repo_name is nil' do
        pull_request = PullRequest.retrieve('My pull request', nil)
      end
    end

    context 'It recieves valid arguments' do
      it 'returns the pull_request when it exists in the database' do
        pull_request = PullRequest.retrieve('My repo', 'My pull request')
        puts pull_request.to_hash
        expect(pull_request.pull_request_name).to eq('My pull request')
        expect(pull_request.repo_name).to eq('My repo')
      end
    end
  end

  describe 'PullRequest#Delete' do
  end
end
