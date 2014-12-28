# ternary_types

Use True/False/Maybe singletons to evaluate 3-value logic for such great fun.

## Usage

```irb
require 'ternary_types'

T = TernaryTypes::True.instance
M = TernaryTypes::Maybe.instance
F = TernaryTypes::Flase.instance

!T # => #<TernaryTypes::False:0x007feccc7c4938>
!M # => #<TernaryTypes::Maybe:0x007feccc7b61f8>
T == F # => #<TernaryTypes::True:0x007feccc7bc670>
M == T # => #<TernaryTypes::Maybe:0x007feccc7b61f8>
M == M # => #<TernaryTypes::Maybe:0x007feccc7b61f8>
T == T # => #<TernaryTypes::True:0x007feccc7bc670>
T & F # => #<TernaryTypes::False:0x007feccc7c4938>
M & T # => #<TernaryTypes::Maybe:0x007feccc7b61f8>
T | F # => #<TernaryTypes::True:0x007feccc7bc670>
T ^ T # => #<TernaryTypes::False:0x007feccc7c4938>

include TernaryTypes::Coersion

Ternary(true) # => #<TernaryTypes::True:0x007feccc7bc670>
Ternary(:foo) # => #<TernaryTypes::True:0x007feccc7bc670>

Ternary(false) # => #<TernaryTypes::False:0x007feccc7c4938>
Ternary(nil) # => #<TernaryTypes::False:0x007feccc7c4938>

Ternary(:maybe) # => #<TernaryTypes::Maybe:0x007feccc7b61f8>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ternary_types'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ternary_types

## Contributing

1. Fork it ( https://github.com/[my-github-username]/ternary_types/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
