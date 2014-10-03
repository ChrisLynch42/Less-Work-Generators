require 'active_record'
require 'active_support'
require 'yaml'
=begin
This class provides an adapter around ActiveRecord::Base to provide
database access to the classes that implement this module.
=end

module LessWork
  module DatabaseMixin
    extend ActiveSupport::Concern

    module ClassMethods
      mattr_accessor :database_config_path, :database_configuration, :base_dir

      def set_databse_config_path(config_path=nil)
        if config_path.nil?
          self.database_config_path = Dir.pwd + '/config/database.yml'
        else
          self.database_config_path=config_path
        end
      end

      def set_database_configuration
        if database_config_path.nil?
          set_databse_config_path
        end
        self.database_configuration = YAML.load(File.read(database_config_path))
      end

      def connect_to_database
        set_database_configuration
        if self.database_configuration.nil?
          raise Exception.new("Database configuration is nil.")
        end
        if self.database_configuration['development']
          config = self.database_configuration['development']
        else
          config = self.database_configuration
        end
        if config['database'].nil?
          raise Exception.new("database location is nil.")
        end
        unless FileTest.exist?(config['database'])
          raise Exception.new("Database " + config['database'] + " does not exist.")
        else

        end
        ActiveRecord::Base.establish_connection(config)
        #######This is necessary to force a database connection.  Otherwise connected? returns false
        ActiveRecord::Base.connection.tables
        unless ActiveRecord::Base.connected?
          raise Exception.new("Database Connection failed!")
        end
      end
    end

  end
end