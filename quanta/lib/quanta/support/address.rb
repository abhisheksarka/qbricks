module Quanta
  module Support
    # This module provides a namespace
    # for all classes/modules that define
    # support methods for managing addresses
    #
    # Author::    Abhishek Sarkar(abhishek@qubricks.com)
    # Copyright:: Copyright (c) 2018 Qubricks
    # License::   Proprietary
    module Address
      class << self
        def join(hash)
          d = hash
          [
            d[:apartment_number],
            d[:complex_name],
            d[:locality],
            d[:city].try(:titleize),
            d[:state].try(:titleize),
            d[:pincode],
            d[:country].try(:titleize)
          ].compact.join(', ')
        end
      end
    end
  end
end
