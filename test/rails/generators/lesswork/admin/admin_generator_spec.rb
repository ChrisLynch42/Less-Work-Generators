require_relative 'test_helper'

describe 'Admin Generator behaviour' do

  describe "Class Methods" do
    it 'should have the next migration class method' do
      result = LessWork::Admin::AdminGenerator.next_migration_number('db/migrate')
      result.should_not == nil

    end
  end
end