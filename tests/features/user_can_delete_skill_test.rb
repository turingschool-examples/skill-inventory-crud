require_relative "../test_helper"

class UserCanDeleteSkillTest < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_can_delete_skill
    SkillInventory.delete_all
    make_skills
    skill = Skill.new(SkillInventory.database.from(:skills)[:name => "Skill2"])
    id = skill.id

    # user visits homepage
    visit "/"

    assert current_path == "/skills"
    assert page.has_content?("Skill2")

    # user clicks on title
    click_on("Skill2")
    assert current_path == "/skills/#{id}"

    # user clicks to delete
    within "form" do
      click_button("Delete this Skill")
    end

    # user does not see title on /skills page
    assert current_path == "/skills"
    refute page.has_content?("Skill2")
    SkillInventory.delete_all
  end

end
