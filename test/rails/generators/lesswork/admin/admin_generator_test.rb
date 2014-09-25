require 'minitest/autorun'
require 'rails/generators/test_case'
require_relative '../../../../../lib/rails/generators/lesswork/admin/admin_generator'

class AdminGeneratorTest < Rails::Generators::TestCase
  #tests LessWork::Admin::AdminGenerator
  def test_me
    assert_equal(true, true)
    puts "xxxxxxxxxxx"
  end

end