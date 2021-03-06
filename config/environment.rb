# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem 'mislav-will_paginate',
             :lib => 'will_paginate',
             :source => 'http://gems.github.com',
             :version => '~> 2.3.11'
  config.gem 'thoughtbot-clearance',
             :lib => 'clearance',
             :source => 'http://gems.github.com',
             :version => '>= 0.7.0'
  config.gem 'justinfrench-formtastic',
             :lib => 'formtastic',
             :source => 'http://gems.github.com',
             :version => '~> 0.2.1'
  config.gem 'thoughtbot-paperclip',
             :lib => 'paperclip',
             :source => 'http://gems.github.com',
             :version => '>= 2.3.0'
  config.gem 'rack',
             :version => '>= 1.0.0'
  config.gem 'chriseppstein-compass',
             :lib => 'compass',
             :source => 'http://gems.github.com',
             :version => '>= 0.8.12'
             
  config.gem "semanticart-is_paranoid", 
             :lib => 'is_paranoid',
             :source => 'http://gems.github.com'
             
  config.gem "rubyist-aasm",
             :lib => "aasm",
             :source => 'http://gems.github.com'
  
  config.load_paths += Dir.glob(File.join(RAILS_ROOT, 'vendor', 'gems', '*', 'lib'))

  config.time_zone = 'London'

  # config.active_record.observers = :cacher, :garbage_collector
end

