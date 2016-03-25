require_relative "../test_helper"

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
