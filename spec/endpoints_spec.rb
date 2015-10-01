require 'rspec'
require 'rack/test'
require_relative '../app/endpoints'
require_relative 'test_data.rb'

describe App do
  include Rack::Test::Methods
  include TestData
  def app
    App
  end
  
  describe 'POST /github_listener' do
  
    before do
      stub_request(:post, /api.hipchat.com\/v2\/room/)
      .to_return(:status => 204)
    end

    context 'receives a pull request notification of open' do
      it 'creates entry for new pull request' do
        expect(PullRequest).to receive(:create)
        post '/github_listener', github_pull_request_opened, {}
      end

      it 'pushes notification to hipchat' do
        expect(HipchatMessenger).to receive(:notify)
        post '/github_listener', github_pull_request_opened, {}
      end
    end

    context 'receives a pull request notification of closed' do
      it 'creates entry for new pull request' do
        expect(PullRequest).to receive(:delete).with()
        post '/github_listener', github_pull_request_closed, {}
      end

      it 'pushes notification to hipchat' do
        expect(HipchatMessenger).to receive(:notify)
        post '/github_listener', github_pull_request_closed, {}
      end
    end

    context 'receives a pull request notification of reopen' do
      it 'creates entry for new pull request' do
        expect(PullRequest).to receive(:new)
      end

      it 'pushes notification to hipchat' do
        response = App.notify_hipchat
        expect(response.status).to eq(200)
      end
    end
  end
end
