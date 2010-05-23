# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.6' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.plugins = [ :all ]
  config.time_zone = 'UTC'
  # config.i18n.default_locale = :de
  config.gem 'cancan'
  config.gem 'state_machine'
end
require 'authlogic'