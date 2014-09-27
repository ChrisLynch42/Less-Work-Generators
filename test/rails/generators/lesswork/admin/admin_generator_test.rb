require 'minitest/autorun'
require 'rails/generators/test_case'
require_relative '../../../../../lib/rails/generators/lesswork/admin/admin_generator'

class AdminGeneratorTest < Rails::Generators::TestCase
  #tests LessWork::Admin::AdminGenerator

  Rails::Generators::TestCase.destination_root = Dir.pwd + '/input'
  def test_me
    assert_equal(true, true)
    puts destination_root
  end

end