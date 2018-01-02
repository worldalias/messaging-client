module Messaging
  module Client
    class Mail
      AVAILABLE_TYPES = %w[confirmation_pin]

      attr_reader :type, :content, :emails, :api_token, :client

      def initialize(opts = {})
        @type = opts[:type]
        @content = opts[:content]
        @emails = opts[:emails]
        @client = Curl::Easy.new
        @client.url = "#{Messaging::Client.url}/mail_messages"
      end

      def valid?
        return unless type&.in?(AVAILABLE_TYPES)
        return unless emails
        true
      end

      def send_mail
        unless valid?
          Logging.logger.error "[#{Messaging::Client.logging_label}] Invalid attributes"
          return
        end

        begin
          send(type)
        rescue Curl::Err::CurlError => e
          Logging.logger.error "[#{Messaging::Client.logging_label}] #{e.message} #{client.url}"
        end
      end

      private

      def apply_api_auth_headers
        client.headers['Accept'] = 'application/json'
        client.headers['Accept-Language'] = content[:locale] || 'en'
        client.headers['X-API-TOKEN'] = Messaging::Client.api_token
      end

      def confirmation_pin
        return unless pin =  @content[:pin]
        fields = []
        apply_api_auth_headers
        emails.each do |email|
          fields << Curl::PostField.content("message[emails][]", email.to_s)
        end
        fields << Curl::PostField.content("message[type]", type.to_s)
        fields << Curl::PostField.content("message[content][pin]", pin.to_s)
        client.http_post(*fields)
        Logging.logger.error "[#{Messaging::Client.logging_label}] #{client.response_code} #{client.body_str}"
      end
    end
  end
end
