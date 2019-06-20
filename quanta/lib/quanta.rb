require 'webdrivers/chromedriver'
require "quanta/version"
require 'pry'
require 'open-uri'
require 'tempfile'

# All environment requirements
require 'webdrivers'
require 'uri'
require 'active_support'
require 'active_support/core_ext'
require 'watir'
require 'watir-scroll'
require 'fuzzystringmatch'

require_relative 'quanta/support'
require_relative 'quanta/hash_mapped'
require_relative 'quanta/element'
require_relative 'quanta/browsable_base'
require_relative 'quanta/browsable_rb'
require_relative 'quanta/browsable_js'

module Quanta
  MAX_LOOKUP_DEPTH = 50
end
