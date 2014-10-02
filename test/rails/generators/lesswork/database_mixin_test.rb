require 'minitest/autorun'
require_relative 'trial_database_mixin'

class DatabaseMixinTest < Minitest::Test

  def test_database_config_path
    assert(TrialDatabaseMixin.respond_to?(:set_database_config_path),'TrialDatabaseMixin does not have set_database_config_path method.')
    TrialDatabaseMixin.set_database_config_path
    assert(!TrialDatabaseMixin.database_config_path.nil?,"Database_config_path was nil.")
    assert(TrialDatabaseMixin.database_config_path.end_with?('/config/database.yml'),"Database_config_path did not end with /config/database.yml.")
    TrialDatabaseMixin.set_database_config_path('aaa')
    assert(TrialDatabaseMixin.database_config_path.end_with?('aaa'),"Database_config_path did not end with aaa.")
  end

end