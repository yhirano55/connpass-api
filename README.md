# connpass-api

API Client for [connpass.com](https://connpass.com/) (UNOFFICIAL)

## Installation

    $ gem install connpass-api

## Usage

```ruby
# return an instance of Faraday::Response
res = Connpass.list_events(keyword: 'Ruby on Rails')

# return an instance of Hashie::Mash
res.body
```

API Reference: https://connpass.com/about/api/

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
