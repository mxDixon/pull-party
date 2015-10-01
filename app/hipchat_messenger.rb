require 'httparty'

class HipchatMessenger
    def self.notify message
        roompath = "https://api.hipchat.com/v2/room/#{ENV['HIPCHAT_ROOM']}/notification?auth_token=#{ENV['HIPCHAT_AUTH_TOKEN']}"
        HTTParty.post(
            roompath, { body: make_body(message) }
        )

    end

    def self.make_body message
        {
            color: "green",
            message: "#{message}",
            notify: false,
            message_format: "text"
        }
    end
end
