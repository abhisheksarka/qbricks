require "quasi/version"
require 'pry'
require 'open-uri'
require 'tempfile'

# All environment requirements
require 'uri'
require 'active_support'
require 'active_support/core_ext'
require 'watir'
require 'watir-scroll'
require 'fuzzystringmatch'

require_relative 'quasi/support'
require_relative 'quasi/hash_mapped'
require_relative 'quasi/element'
require_relative 'quasi/browsable'

module Quasi
  MAX_LOOKUP_DEPTH = 50
end
