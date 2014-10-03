require 'minitest/autorun'
require_relative 'trial_database_mixin'
require_relative 'test_helper'

class DatabaseMixinTest < Minitest::Test

  def setup
    prepare_temp_database(Dir.pwd)
  end

  def teardown
    cleanup_temp_database
  end

  def test_database_config_path
    assert(TrialDatabaseMixin.respond_to?(:set_databse_config_path),'TrialDatabaseMixin does not have set_config_path method.')
    TrialDatabaseMixin.set_databse_config_path
    assert(!TrialDatabaseMixin.database_config_path.nil?,"Database_config_path was nil.")
    assert(TrialDatabaseMixin.database_config_path.end_with?('/config/database.yml'),"Database_config_path did not end with /config/database.yml.")
    TrialDatabaseMixin.set_databse_config_path('aaa')
    assert(TrialDatabaseMixin.database_config_path.end_with?('aaa'),"Database_config_path did not end with aaa.")
  end

  def test_database_configuration
    TrialDatabaseMixin.set_databse_config_path(@temp_database + "/database.yml")
    assert(TrialDatabaseMixin.respond_to?(:set_database_configuration),'TrialDatabaseMixin does not have set_database_configuration method.')
    TrialDatabaseMixin.set_database_configuration
    assert(!TrialDatabaseMixin.database_configuration.nil?,"database_configuration was nil.")
    assert(TrialDatabaseMixin.database_configuration.is_a?(::Hash),"database_configuration was not a hash.")
    assert(!TrialDatabaseMixin.database_configuration['adapter'].nil?,"database_configuration['development'] was nil.")
  end


  def test_database_connection
    TrialDatabaseMixin.set_databse_config_path(@temp_database + "/database.yml")
    TrialDatabaseMixin.connect_to_database
  end

end