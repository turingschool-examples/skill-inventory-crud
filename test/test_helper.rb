ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'capybara/dsl'
require 'tilt/erb'

Capybara.app = SkillInventoryApp

Capybara.save_and_open_page_path = "tmp/capybara"

module TestHelpers
  def teardown
    skill_inventory.delete_all
    super
  end

  def skill_inventory
    database = YAML::Store.new('db/skill_inventory_test')
    @skill_inventory ||= SkillInventory.new(database)
  end
end
