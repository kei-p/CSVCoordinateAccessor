# CSVCoordinateAccessor

CSVCoordinateAccessor is module for setter and getter with coordinate like csv.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'csv_coordinate_accessor'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install csv_coordinate_accessor

## Usage

```
require 'csv_coordinate_accessor'
csv = CSV.read('./spec/fixtures/sample.csv').extend CSVCoordinateAccessor
=> [["id", "category", "name"], ["1", "fruit", "apple"], ["2", "furit", "orange"], ["3", "fruit", "banana"]]

## Extend module
csv = csv.extend CSVCoordinateAccessor

## get value with coordinate
csv.get('A2')
=> "1"
csv.get('B2')
=> "fruit"
csv.get('C2')
=> "apple"

## set value with coordinate
csv.set('C2', 'pineapple')

csv
=> [["id", "category", "name"], ["1", "fruit", "pineapple"], ["2", "furit", "orange"], ["3", "fruit", "banana"]]
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/csv_coordinate_accessor/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
