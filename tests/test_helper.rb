ENV['RACK_ENV'] ||= 'test'

require_relative "../app/controllers/skill_inventory_app"
require_relative "../app/models/skill_inventory"
require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'tilt/erubis'

Capybara.app = SkillInventoryApp

module TestHelpers

  def teardown
    SkillInventory.delete_all
    super
  end

  def make_skills(number = 4)
    number.times do |i|
      SkillInventory.add({name: "Skill#{i + 1}", status: "Status #{i + 1}" })
    end
  end
end
