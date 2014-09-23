require "active_record"
require "active_record/migration"
require "rails"
require "rails/generators"
require "rails/generators/active_record/migration"

module LessWork
  module Admin
    class AdminGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      include ActiveRecord::Generators::Migration

    end
  end
end