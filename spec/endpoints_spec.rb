require 'rspec'
<<<<<<< HEAD
require 'endpoints'
=======
require_relative '../app/endpoints'
>>>>>>> 8b33f927aa47489d77b61939efe074ead6875ccc

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
