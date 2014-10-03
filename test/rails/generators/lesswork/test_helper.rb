require 'rails/generators/test_case'

Rails::Generators::TestCase.destination_root = Dir.pwd + '/input'


def prepare_temp_database(base_dir)
  @temp_database=base_dir + "/temp_database"
  unless FileTest::directory?(@temp_database)
    Dir::mkdir(@temp_database)
  end
  database_file= base_dir + '/test_database/development.sqlite3'
  FileUtils.cp(database_file,@temp_database)
  database_file= base_dir + '/test_database/change.sqlite3'
  FileUtils.cp(database_file,@temp_database)
  database_file= base_dir + '/test_database/database.yml'
  FileUtils.cp(database_file,@temp_database)
end

def cleanup_temp_database
  FileUtils.rm_rf(@temp_database)
end