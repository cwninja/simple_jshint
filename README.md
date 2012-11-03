# SimpleJSHint [![Build Status](https://secure.travis-ci.org/cwninja/simple_jshint.png)](http://travis-ci.org/cwninja/simple_jshint)


Wraps jshint.js in the simplest wrapper I could imagine.


## Installation

Add this line to your application's Gemfile:

    gem 'simple_jshint'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_jshint

## Usage

    require "simple_jshint"
    result = SimpleJSHint.check("some('dodgy').javascript()\ncode;")
    result.ok? # => false
    result.length # => 2
    result.first # => "Line 1: some('dodgy').javascript() : Error Missing semicolon.",

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
