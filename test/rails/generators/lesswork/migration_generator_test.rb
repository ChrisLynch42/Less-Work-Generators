require 'minitest/autorun'
require_relative 'test_helper'
require_relative '../../../../lib/rails/generators/lesswork/migration_generator'

class MigrationGeneratorTest < Rails::Generators::TestCase
  tests LessWork::MigrationGenerator

  def test_setup
    assert_equal(true, true)
    puts destination_root
  end


  def test_run_generator
    #content = run_generator ["--help"]
    #puts content
  end

end