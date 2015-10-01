require 'rspec'
require 'httparty'

describe HipchatMessenger do
    it 'notifies' do
        response = HipchatMessenger.notify('pull1')
        response.status = 200
    end
end
