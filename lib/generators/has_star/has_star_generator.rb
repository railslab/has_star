require 'rails/generators/active_record'

class HasStarGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  include Rails::Generators::Migration

  def create_migration_file
    # using Rails::Generators::Migration
    migration_template 'add_star_to.rb.erb', "db/migrate/add_star_to_#{table_name}.rb"
  end

  def add_has_star_to_model
    with_file model_file do |file|
      insert_into_file file, "\n  has_star", after: 'ActiveRecord::Base'
    end
  end

  def add_has_star_to_controller
    with_file controller_file do |file|
      insert_into_file file, render_template('controller.erb'), after: /class .+$/
    end
  end

  def add_has_star_to_routes
    with_file 'config/routes.rb' do |file|
      insert_into_file file, "\n  has_star :#{table_name}", after: 'Rails.application.routes.draw do'
    end
  end

  def add_has_star_to_css
    with_file 'app/assets/stylesheets/application.css' do |file|
      insert_into_file file, " *= require has_star\n", before: ' *= require_tree'
    end
  end

  private

  def render_template(name)
    template = File.expand_path(find_in_source_paths(name))
    ERB.new(::File.binread(template), nil, "-", "@output_buffer").result(instance_eval("binding"))
  end

  def with_file(file, &block)
    return say("File not found: #{file}", :magenta) unless File.exist? Rails.root.join(file)
    yield file
  end

  # convert the name from commandline like:
  # rails g has_star posts
  # rails g has_star post
  # rails g has_star Post
  # to posts
  def table_name
    name.tableize
  end

  def model_class
    table_name.classify
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
