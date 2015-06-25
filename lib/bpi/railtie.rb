module Bpi
  class Railtie < Rails::Railtie

    # This defines configuration items meant to be overriden
    # in the client application.rb file.
    config.bpi = ActiveSupport::OrderedOptions.new

    # This is required for authentification.
    config.bpi.partenaire = ''
  end
end