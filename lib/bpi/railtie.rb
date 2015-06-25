module Bpi
  class Railtie < Rails::Railtie

    # This defines configuration items meant to be overriden
    # in the client application.rb file.
    config.bpi = ActiveSupport::OrderedOptions.new

    # This is required for authentification.
    config.bpi.partenaire = ''
    config.bpi.dictionary = {}
    config.bpi.reference_partenaire = ''
    config.bpi.date_export = Time.now.strftime("%Y-%m-%d")
  end
end