require "messaging/client/version"
require "messaging/client/mail"

module Messaging
  module Client
    class << self
      def logging_label
        @logging_label ||= 'MESSAGING'
      end

      def url
        @url ||= 'http://localhost:9293'
      end

      def api_token
        @api_token ||= 'someSecretApiToken'
      end
    end
  end
end
