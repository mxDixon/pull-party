require 'rspec'
require 'app/endpoints'

describe App do
    describe 'POST /github_listener' do
        context 'receives a valid notification' do
            it 'creates entry for new pull request' do
                expect(PullReqest).to receive(:new)
            end

            it 'pushes notification to hipchat' do

            end
        end
    end
end
