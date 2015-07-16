require "bpi/version"
require 'nokogiri' if defined? Rails
require "bpi/railtie" if defined? Rails
require "bpi/builder"
require "bpi/tag_finder"

module Bpi
end
