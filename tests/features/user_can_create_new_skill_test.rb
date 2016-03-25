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

class UserCanCreateNewSkillTest < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_can_create_new_skill
    make_skills

    # user visits homepage
    visit "/"

    assert current_path == "/skills"
    assert page.has_content?("Skill2")
    refute page.has_content?("Wow")

    # user clicks add a skill
    click_link("Add a Skill")

    # user enters name of skill and status of skill
    assert current_path == "/skills/new"
    fill_in("skill[name]", :with => "Wow")
    fill_in("skill[status]", :with => "New status.")

    # user clicks submit
    click_on("Create Skill")

    # user sees title on /skills page
    assert current_path == "/skills"
    assert page.has_content?("Wow")

    # user clicks on title
    click_link("Wow")

    # user sees title and status
    assert page.has_content?("Wow")
    assert page.has_content?("New status.")
  end

end
