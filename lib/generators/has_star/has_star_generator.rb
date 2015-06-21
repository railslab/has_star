require 'rails/generators/active_record'

class HasStarGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  include Rails::Generators::Migration

  def create_migration_file
    # using Rails::Generators::Migration
    migration_template 'add_star_to.rb.erb', "db/migrate/add_star_to_#{table_name}.rb"
  end

  def add_has_star_to_model
    file = model_file
    return say("File not found: #{'config/routes.rb'}") unless File.exist? file
    insert_into_file file, "\n  has_star", after: 'ActiveRecord::Base'
  end

  def add_has_star_to_controller
    file = controller_file
    return say("File not found: #{'config/routes.rb'}") unless File.exist? file
    insert_into_file file, "\n  has_star", after: /class .+$/
  end

  def add_has_star_to_routes
    file = 'config/routes.rb'
    return say("File not found: #{'config/routes.rb'}") unless File.exist? file
    insert_into_file file, "\n  has_star :#{table_name}", after: 'Rails.application.routes.draw do'
  end

  private

  # convert the name from commandline like:
  # rails g has_star posts
  # rails g has_star post
  # rails g has_star Post
  # to posts
  def table_name
    name.tableize
  end

  def model_file
    "app/models/#{table_name.singularize}.rb"
  end

  def controller_file
    "app/controllers/#{table_name}_controller.rb"
  end

  # required by Rails::Generators::Migration
  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
end
