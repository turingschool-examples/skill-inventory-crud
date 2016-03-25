ENV['RACK_ENV'] ||= 'test'

require_relative "../../app/controllers/skill_inventory_app"
require_relative "../../app/models/skill_inventory"
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

class UserCanDeleteSkillTest < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_can_create_new_skill
    make_skills

    # user visits homepage
    visit "/"

    assert current_path == "/skills"
    assert page.has_content?("Skill2")

    # user clicks on title
    click_on("Skill2")

    # user clicks to delete
    click_button("Delete this skill")

    # user does not see title on /skills page
    assert current_path == "/skills"
    refute page.has_content?("Skill2")

  end

end
