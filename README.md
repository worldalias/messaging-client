# Messaging::Client

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'messaging-client'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install messaging-client

## Usage

### Configuration in Sinatra APP

**Add to your initializers file messaging_client.rb with content**
```
messaging_api_settings ||= Settings.services.detect { |s| s.name == 'messaging-api' }

Messaging::Client.configure do |config|
  config.logging_label = 'MESSAGING'
  config.url = messaging_api_settings.url
  config.api_token = messaging_api_settings.token
end
```

### Send MAIL message example
```
Messaging::Client::Mail.new(
  type: 'confirmation_pin',
  emails: ['test@gmail.com'],
  content: {
    pin: '1234567',
    locale: I18n.locale
  }
).send_mail
```


### Send SMS message example
```
Messaging::Client::Sms.new(
  type: 'confirmation_pin',
  phones: ['+380665554433'],
  content: {
    pin: '1234567',
    locale: I18n.locale
  }
).send_sms
```

### Test
```
cp .ruby-version.example .ruby-version && cp .ruby-gemset.example .ruby-gemset && cd ../messaging-cient && bundle && rspec

```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/messaging-client/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
