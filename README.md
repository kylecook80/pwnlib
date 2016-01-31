# Pwnlib

A simple gem used for creating exploits (usually for CTFs)

## Installation

Install with `gem install pwnlib` or use bundler

## Usage

Add

```ruby
require 'pwnlib'
include Pwnlib

p = process("./app")

p.close
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pwnlib/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
