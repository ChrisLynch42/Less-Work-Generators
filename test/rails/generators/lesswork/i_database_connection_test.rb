require 'minitest/autorun'
require_relative 'trial_database_connection'

class IDatabaseConnectionTest < Minitest::Test

  def test_get_connectionconnection
    assert(TrialDatabaseConnection.respond_to?(:set_default_database_config_path),'TrialDatabaseConnection does not have get_connection method.')
    TrialDatabaseConnection.set_default_database_config_path
    assert(!TrialDatabaseConnection.database_config_path.nil?,"Database_config_path was nil.")
    assert(TrialDatabaseConnection.database_config_path.end_with?('/config/database.yml'),"Database_config_path did not end with /config/database.yml.")


  end

end