# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)

# Sass por medio de Rack
require 'sass/plugin/rack'
use Sass::Plugin::Rack
Sass::Plugin.options[:never_update] = true

run Forcegrid::Application