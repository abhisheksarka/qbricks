require 'active_support'
require 'active_record'
require 'active_support/core_ext'
require 'devise'
require 'quanta'
require 'core/extensions'
require 'core/version'
require 'core/initialisers'
require 'core/models'
require 'core/services'

module Core
  module_function

  def rails_setup
    Rails.application.config.paths['db/migrate'] = rails_db_path
  end

  def rails_db_path
    Gem.loaded_specs['core'].full_gem_path + '/lib/core/db'
  end

  def establish_connection
    ActiveRecord::Base.establish_connection(
      database: ENV['QUBRICKS_DB_NAME'],
      host: ENV['QUBRICKS_DB_HOST'],
      username: ENV['QUBRICKS_DB_USER'],
      password: ENV['QUBRICKS_DB_PASS'],
      adapter: 'postgresql'
    )
  end
end
