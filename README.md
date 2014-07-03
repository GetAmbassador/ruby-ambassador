# mbsy [![Gem Version](https://badge.fury.io/rb/mbsy.svg)](http://badge.fury.io/rb/mbsy) [![Dependency Status](https://gemnasium.com/GetAmbassador/mbsy.svg)](https://gemnasium.com/GetAmbassador/mbsy)

Ambassador API wrapper for Ruby.

This is a lightweight Ruby wrapper for the [Ambassador](http://getambassador.com) API.

## Installation

Add this line to your application's Gemfile:

```
gem 'mbsy'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install mbsy
```

If you're using Rails 2 you could include this gem in your configuration, i.e. in `environment.rb`

```ruby
config.gem 'mbsy'
```

## Usage

Make sure you include your api credentials in an initialiser.

```ruby
Mbsy.configure do |c|
  c.api_key = 'MY_API_KEY'
  c.user_name = 'MY_USER_NAME'
end
```

The mbsy gem will give you access to classes such as:

- `Mbsy::Company`
- `Mbsy::Ambassador`
- `Mbsy::Shortcode`

Some examples:

```ruby
# Create a new ambassador
Mbsy::Ambassador.create(:email => 'example@example.com')

# Add 50 to user account
Mbsy::Balance.update(:add,{:email => 'example@example.com', :amount => 50})

# Deduct 25 from user account
Mbsy::Balance.update(:deduct,{:email => 'example@example.com', :amount => 25})

# Get company details
Mbsy::Company.get_details

# Register a referral event 
# Note the email address is the new customer email, not the ambassador
# Autocreate flag sets whether they are created as a new ambassador or not
Mbsy::Event.create({:email => 'example@example.com', :short_code => REFERRALSHORTCODE, :campaign_uid =>  YOURCAMPAIGNUID, :auto_create => 0})

# Register a revenue event for an ambassador
Mbsy::Event.create({:email => 'example@example.com', :short_code => REFERRALSHORTCODE, :revenue => 120, :campaign_uid => YOURCAMPAIGNUID})

# Register a revenue event for an ambassador
# in this case, the email is for a previously registered referred customer, so no short code is required
Mbsy::Event.create({:email => 'example@example.com', :revenue => 120, :campaign_uid => YOURCAMPAIGNUID})

# Get the details on a shortcode
Mbsy::Shortcode.find({ :short_code => YOURCAMPAIGNUID })

# Shortcode in a sandbox campaign
Mbsy::Shortcode.find({ :short_code => YOURCAMPAIGNUID, :sandbox => 1 })
```

## Contributing to mbsy
 
- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Make sure to add tests for it. This is important so we don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## To Do

- [ ] Finish off test suite.

## Copyright

Copyright (c) 2014 ZFERRAL, INC. See LICENSE for further details.

