require_relative './support/url'
require_relative './support/address'
require_relative './support/file'
require_relative './support/string'

module Quanta
  # This module provides a namespace
  # for all classes/modules that define
  # support methods for different objects
  #
  # Author::    Abhishek Sarkar(abhishek@qubricks.com)
  # Copyright:: Copyright (c) 2018 Qubricks
  # License::   Proprietary
  module Support
    include Support::Url
    include Support::Address
    include Support::File
    include Support::String
  end
end
