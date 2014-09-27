require "active_record"
require "active_record/migration"
require "rails"
require "rails/generators"
require "rails/generators/active_record/migration"

module LessWork

  class MigrationGenerator
    include Rails::Generators::Migration
    include ActiveRecord::Generators::Migration

  end
end