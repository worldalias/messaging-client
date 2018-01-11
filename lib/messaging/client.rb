require 'messaging/client/version'
require 'messaging/client/config'
require 'messaging/client/mail'
require 'messaging/client/sms'

module Messaging
  module Client
    class << self
      def configure(&_block)
        yield config
      end

      def config
        @config ||= Config.new
      end
    end
  end
end
