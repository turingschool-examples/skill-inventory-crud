require_relative '../test_helper'

class UserCanUpdateASkillTest < FeatureTest
  def test_user_can_update_a_skill
    seed_skills
    visit '/skills'
    assert page.has_content?("Coding is cool")
    find('li:first').click_on("Coding is cool")
    assert "/skills/skill.id", current_path
    click_on("Edit")
    assert "/skills/skill.id/edit", current_path
    find("input")
    assert ("value=Coding is cool")
    assert page.has_content?("I know it's cool")
    fill_in "Name", with: "Golf"
    fill_in "Description", with: "I can play golf"
    click_button("Save")
    assert "/skills/skill.id", current_path
    assert page.has_content?("Golf")
    refute page.has_content?("Coding is cool")
    assert page.has_content?("I can play golf")
    refute page.has_content?("I know it's cool")
  end
end
