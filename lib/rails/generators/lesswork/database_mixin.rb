require 'active_record'
require 'active_support'
require 'yaml'

module LessWork
  module DatabaseMixin
    extend ActiveSupport::Concern

    module ClassMethods
      mattr_accessor :database_config_path, :database_configuration

      def set_default_database_config_path(config_path=nil)
        if config_path.nil?
          self.database_config_path = Dir.pwd + '/config/database.yml'
        else
          self.database_config_path=config_path
        end
      end

      def get_configuration
        if database_config_path.nil?
          set_default_database_config_path
        end
        database_configuration = YAML.load(File.read(database_config_path))
      end

      def connect
        get_configuration
        if @database_configuration.nil?
          raise Exception.new("Database configuration is nil.")
        end
        if @database_configuration['development']
          config = @database_configuration['development']
        else
          config = @database_configuration
        end
        unless config['database'][0] == '/'
          config['database']=@options[:rails_dir] + '/' + config['database']
        end
        unless FileTest.exist?(config['database'])
          raise Exception.new("Database " + config['database'] + " does not exist.")
        else

        end
        ActiveRecord::Base.establish_connection(config)
        ActiveRecord::Base.connection.tables
        unless ActiveRecord::Base.connected?
          raise Exception.new("Database Connection failed!")
        end
      end
    end

  end
end