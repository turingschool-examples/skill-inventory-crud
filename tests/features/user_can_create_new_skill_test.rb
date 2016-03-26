require_relative "../test_helper"

class UserCanCreateNewSkillTest < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_can_create_new_skill
    SkillInventory.delete_all
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
    SkillInventory.delete_all
  end

end
