# Cartographie

Cartographie is a wrapper for Google's Static Maps API

## Installation

Add this line to your application's Gemfile:

    gem 'cartographie'

Or install it yourself as:

    $ gem install cartographie

## Usage

```ruby
require 'cartographie'
Cartographie.map('San Francisco, CA')
Cartographie.map('New York, NY', width: 200, height: 200, zoom: 10)
```

**Defaults**

- width: 300
- height: 300
- zoom: 15
- sensor: false

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
