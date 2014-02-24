# Dependency Injection for Sinatra

`Sinatra::DependencyInjection` adds a helper method, called `container`, to access to your ruby
[dependency injection container](https://github.com/kdisneur/dependency_injection-ruby)

## Installation

Just add the gem to your Gemfile

```ruby
gem 'dependency_injection-sinatra'
```

Or simply install it using rubygems:

```ruby
gem install dependency_injection-sinatra
```

## Usage

### Classic Application

In a classic application simply require the helper, and start using it:

```ruby
require 'sinatra'
require 'sinatra/dependency_injection'

# define a route that uses the helper
get '/' do
  json container.get('awesome_service').find_trending
end

# The rest of your classic application code goes here...
```

### Modular Application

In a modular application you need to require the helper, and then tell the
application you will use it:

```ruby
require 'sinatra/base'
require 'sinatra/dependency_injection'

class MyApp < Sinatra::Base
  register Sinatra::DependencyInjection

  # define a route that uses the helper
  get '/' do
    json container.get('awesome_service').find_trending
  end

  # The rest of your modular application code goes here...
end
```

### Configuration path

By default it will try to load `services.yml` configuration file, but if
your configuration file is stored in another place, you can easily change it:

```ruby
require 'sinatra/base'
require 'sinatra/dependency_injection'

class MyApp < Sinatra::Base
  register Sinatra::DependencyInjection

  dependency_injection_path 'config/services.yml'

  # The rest of your module application code goes here...
end
```
