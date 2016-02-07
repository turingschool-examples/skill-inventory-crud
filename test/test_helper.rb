ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'capybara/dsl'
require 'tilt/erb'

DatabaseCleaner[:sequel, {:connection => Sequel.sqlite("db/skill_inventory_test.sqlite3")}].strategy = :truncation

Capybara.app = SkillInventoryApp
Capybara.save_and_open_page_path = "tmp/capybara"

module TestHelpers
  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
    super
  end

  def skill_inventory
    database = Sequel.sqlite("db/skill_inventory_test.sqlite3")
    @skill_inventory ||= SkillInventory.new(database)
  end
end
