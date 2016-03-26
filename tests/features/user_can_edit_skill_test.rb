require_relative "../test_helper"

class UserCanEditSkillTest < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_edit_skill
    make_skills

    # user visits homepage
    visit "/"

    assert current_path == "/skills"
    assert page.has_content?("Skill3")
    refute page.has_content?("Wow")

    # user clicks on title
    click_link("Skill3")

    # user clicks to edit
    click_link("Edit this Skill")

    # user enters name of skill and status of skill
    assert current_path == "/skills/3/edit"
    fill_in("skill[name]", :with => "Wow")
    fill_in("skill[status]", :with => "New status.")

    # user clicks submit
    click_on("Confirm Edits")

    # user sees new info in skill page
    assert current_path == "/skills/3"
    assert page.has_content?("Wow")
    assert page.has_content?("New status.")
  end

end
