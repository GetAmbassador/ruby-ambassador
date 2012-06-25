# mbsy

Ambassador API wrapper for Ruby.

This is a lightweight Ruby wrapper for the [Ambassador](http://getambassador.com) API.

### Installation

This library can be installed as a gem. It is hosted on [Rubygems](http://rubygems.org).

You can install this library as a gem using the following command:

$ gem install mbsy

### Usage

Simply require this library before you use it:

```ruby
require 'mbsy'
```

If you're using Rails 3.x, you could include this gem in your Gemfile.

```ruby
gem 'mbsy'
```

Install the gem using the following command:
$ bundle install

If you're using Rails 2 you could include this gem in your configuration, i.e. in `environment.rb`

```ruby
config.gem 'mbsy'
```
### Initialise

Make sure you include your api credentials in an initialiser.

```ruby
Mbsy.configure do |c|
	c.api_key 'MY_API_KEY'
	c.user_name 'MY_USER_NAME'
end
```

The mbsy gem will give you access to classes such as:

* `Mbsy::Company`  
* `Mbsy::Ambassador`  
* `Mbsy::Shortcode`

### Contributing to mbsy
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2012 Tom Mullen. See LICENSE.txt for
further details.

