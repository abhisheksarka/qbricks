module Quasi
  module Support
    # This module provides a namespace
    # for all classes/modules that define
    # support methods url parsing, checking, etc
    #
    # Author::    Abhishek Sarkar(abhishek@listpiper.com)
    # Copyright:: Copyright (c) 2018 ListPiper
    # License::   Proprietary
    module Url
      class << self

        # Checks if a given url is a FQDN or just a
        # relative action
        # +url+:: The url to parse
        def host?(url)
          URI.parse(url).host.present?
        end

        def file_id(url)
          uri = URI.parse(url)
          ::File.basename(uri.path)
        end

        def file_name(url)
          file_id(url).split('.')[0..-2].join('.')
        end

        def file_extension(url)
          file_id(url).split('.').last
        end
      end
    end
  end
end
