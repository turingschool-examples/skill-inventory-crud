require 'sqlite3'

ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara/dsl'
require 'launchy'

module TestHelpers
  def seed_skills
    skill1 = SkillInventory.create({
      name: "Coding is cool",
      description: "I know it's cool"
    })
    skill2 = SkillInventory.create({
      name: "Learn capybara",
      description: "Swim in hottub"
    })
  end

  def teardown
    SkillInventory.delete_all
    super
  end
end

Capybara.app = SkillInventoryApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
