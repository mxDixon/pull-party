require 'rspec'
require 'httparty'
require_relative '../app/hipchat_messenger'

describe HipchatMessenger do
    describe '.notify' do
        it 'Pings the room when you send it a message' do
            response = HipchatMessenger.notify('pull1')
            puts response.to_yaml
            puts response.code
            response.code = 200
            
            expect(response.code).to eq(200)
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
