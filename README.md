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
__Deprecation Notice:__ The `balance` method has been deprecated and should no longer be used.

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

# Generate HTML to embed in your page for single-sign-on
Mbsy::SingleSignOn.embed_html(email: current_user.email)

# and similarly, to logout
Mbsy::SingleSignOn.embed_html(email: current_user.email, method: :logout)
```

## Contributing to mbsy
 
- Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
- Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
- Fork the project.
- Start a feature/bugfix branch.
- Commit and push until you are happy with your contribution.
- Make sure to add tests for it. This is important so we don't break it in a future version unintentionally.
- Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Testing
The aptly named repo mbsy-test (https://github.com/carpenter-js/mbsy-test) will be our home for testing. There is no automation and minimal test coverage currently. Furthermore, testing will have to be performed locally due to there being no appliication in a staging nor production environment. See the To Do section below.

Clone mbsy-test
```
git clone git@github.com:carpenter-js/mbsy-test.git
```

cd to mbsy-test
```
cd mbsy-test
```

To install mbsy-test, follow its README

Ensure mbsy and its dependencies are installed from the MASTER branch, start mbsy-test server, hit all available endpoints, copy and paste the URL and responses to an appropriately named file (mbsy-master-results.txt)

Ensure mbsy and its dependencies are installed from the FEATURE branch, start mbsy-test server, hit all available endpoints, copy and paste the URLs and responses to an approprriated named file (mbsy-feature-results.txt)

Diff the results
```
diff ~/<path-to-file>/mbsy-master-results.txt ~/<path-to-file>/mbsy-feature-results.txt
```

Ensure no difference* exists amongst files to ensure existing functionality is not broken
*NOTE: endpoint /mbsy/get_company_token returns a randomly-generated token each subsequent hit; meaning, your diff results should show at least one discrepancy

## To Do

- [ ] Finish off test suite.

## Copyright

Copyright (c) 2014 ZFERRAL, INC. See LICENSE for further details.

