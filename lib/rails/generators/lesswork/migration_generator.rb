require "active_record"
require "active_record/migration"
require "rails"
require "rails/generators"
require "rails/generators/active_record/migration"
require "active_support"

module LessWork

  class MigrationGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    include ActiveRecord::Generators::Migration

    class << self
      attr_accessor :database_config_path
    end
    self.database_config_path = Dir.pwd + '/config/database.yml'






  end
end