require 'rspec'
require 'httparty'
require 'webmock/rspec'
require_relative '../app/hipchat_messenger'

describe HipchatMessenger do
    describe '.notify' do
        it 'Pings the room when you send it a message' do
            stub_request(:post, /api.hipchat.com\/v2\/room/)
              .to_return(:status => 204)
            response = HipchatMessenger.notify('test success')

            expect(response.code).to eq(204)
        end
    end

    describe '.make_body' do
        it 'populates body with the message that you pass it' do
            body = HipchatMessenger.make_body('test')
            expect(body).to eq(
                {
                    color: "green",
                    message: "test",
                    notify: false,
                    message_format: "text"
                }
            )
        end
    end
end
