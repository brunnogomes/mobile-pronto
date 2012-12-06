# MobilePronto API Wrapper

## How to use

### Just put in your Gemfile

```ruby
gem 'mobile_pronto', :git => 'git@github.com:brunnogomes/mobile-pronto.git'
```

### Starting

```ruby
# your API credential and app name here
mp = MobilePronto::SMS.new('AWESOMEAPICREDENTIALS', 'MYAMAZINGAPP')

# Send SMS
# for params see Mobile Pronto docs
response = mp.send('558188888888', 'brunnogomes', 'This is SPARTA!')

# 000 means success, see Mobile Pronto docs for other codes meaning
# the part after the : is the message id
puts response # '000:12345678910'

# Get a message delivery status
puts mp.status('12345678910')

# Get credits balance(in Brazilian Reais - R$)
puts mp.credits # '6.00'
```

## How to run tests

```ruby
rake test
```
