require 'minitest/autorun'
require_relative 'trial_database_mixin'

class DatabaseMixinTest < Minitest::Test

  def test_get_connectionconnection
    assert(TrialDatabaseMixin.respond_to?(:set_default_database_config_path),'TrialDatabaseMixin does not have get_connection method.')
    TrialDatabaseMixin.set_default_database_config_path
    assert(!TrialDatabaseMixin.database_config_path.nil?,"Database_config_path was nil.")
    assert(TrialDatabaseMixin.database_config_path.end_with?('/config/database.yml'),"Database_config_path did not end with /config/database.yml.")


  end

end