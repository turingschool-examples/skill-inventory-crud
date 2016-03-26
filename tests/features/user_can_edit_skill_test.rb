require_relative "../test_helper"

class UserCanEditSkillTest < Minitest::Test

  include TestHelpers
  include Capybara::DSL

  def test_user_edit_skill
    SkillInventory.delete_all
    make_skills
    skill = Skill.new(SkillInventory.database.from(:skills)[:name => "Skill3"])
    id = skill.id
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
    assert current_path == "/skills/#{id}/edit"
    fill_in("skill[name]", :with => "Wow")
    fill_in("skill[status]", :with => "New status.")

    # user clicks submit
    click_on("Confirm Edits")

    # user sees new info in skill page
    assert current_path == "/skills/#{id}"
    assert page.has_content?("Wow")
    assert page.has_content?("New status.")
    SkillInventory.delete_all
  end

end
