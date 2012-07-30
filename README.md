# Cartographie [![Build Status](https://secure.travis-ci.org/mattonrails/cartographie.png?branch=master)](http://travis-ci.org/mattonrails/cartographie)

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

**Configuration**

```ruby
Cartographie.configure do |config|
  config.width = 640
  config.height = 640
  config.zoom = 12
  config.file_format = 'jpg'
  config.sensor = true
end
```

**Defaults**

If you do not pass options when generating a map, nor configure a map attribute
using the configuration block, the following values will be used:

- width: 300
- height: 300
- zoom: 15
- format: 'png'
- sensor: false

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
