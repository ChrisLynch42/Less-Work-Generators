require 'minitest/autorun'
require_relative 'test_helper'
require_relative '../../../../lib/rails/generators/lesswork/migration_generator'

class MigrationGeneratorTest < Rails::Generators::TestCase
  tests LessWork::MigrationGenerator

  def test_assertion
    assert(true, "Assertions did not work")
  end

  def test_run_generator
    content = run_generator ["--help"]
    assert_match(/Runtime options:/, content)
    assert_match(/Description:/, content)
  end

  def test_database_path
    assert(LessWork::MigrationGenerator.respond_to? :database_config_path, 'LessWork::MigrationGenerator did not have database_config_path class method')
    assert(LessWork::MigrationGenerator.database_config_path.end_with?( 'test/config/database.yml'),'Database config path did not contain test/config/database.yml')
  end

end