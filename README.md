# MobilePronto API Wrapper

## How to use

### Just put in your Gemfile

```ruby
gem 'mobile_pronto', :git => 'git@github.com:brunnogomes/mobile-pronto.git'
```

### Starting

```ruby
# your API credential and app name here

mp = MobilePronto::SMS.new('blahblahfd9s8dah6ff4js', 'MYCOOLAPP')

# Send SMS
# for params see Mobile Pronto docs
response = mp.send(558186053963, 'brunnogomes', 'This is SPARTA!')

# 000 means success, see Mobile Pronto docs for other codes meaning
puts response # '000'

```

## How to test

```ruby
rake test
```
