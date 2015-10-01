require 'rspec'
require_relative '../app/endpoints'
require_relative 'test_data.rb'

describe App do
  describe 'POST /github_listener' do

    before do
      stub_request(:post, /api.hipchat.com\/v2\/room/)
      .to_return(:status => 204)
    end

    context 'receives a pull request notification of open' do
      it 'creates entry for new pull request' do
        post '/github_listener', TestData::github_pull_request_opened, {}
        expect(PullRequest).to receive(:create)
      end

      it 'pushes notification to hipchat' do
        post '/github_listener', TestData::github_pull_request_opened, {}
        expect(HipchatMessenger).to receive(:notify)
      end
    end

    context 'receives a pull request notification of closed' do
      it 'creates entry for new pull request' do
        post '/github_listener', TestData::github_pull_request_closed, {}
        expect(PullRequest).to receive(:delete).with()
      end

      it 'pushes notification to hipchat' do
        post '/github_listener', TestData::github_pull_request_closed, {}
        expect(HipchatMessenger).to receive(:notify)
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
