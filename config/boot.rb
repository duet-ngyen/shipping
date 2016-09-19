ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

require 'rails/commands/server'
module Rails
  class Server
    def default_options
      opts = { Port: 3000 }
      opts = opts.merge(Host: '0.0.0.0') if Rails.env.development?
      super.merge opts
    end
  end
end
