require 'rspec'
require_relative '../app/endpoints'

describe App do
    describe 'POST /github_listener' do
        context 'receives a valid notification' do
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
