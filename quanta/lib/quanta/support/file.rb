module Quanta
  module Support
    # This module provides a namespace
    # for all classes/modules that define
    # support methods file management
    #
    # Author::    Abhishek Sarkar(abhishek@qubricks.com)
    # Copyright:: Copyright (c) 2018 Qubricks
    # License::   Proprietary
    module File
      class << self
        def remote_to_local(url)
          io = open(url)
          file = Tempfile.new([Url.file_name(url), ".#{Url.file_extension(url)}"])
          FileUtils.mv io.path, file.path
          file
        end
      end
    end
  end
end
