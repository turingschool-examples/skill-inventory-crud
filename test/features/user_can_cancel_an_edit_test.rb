require_relative '../test_helper'

class UserCanCancelAnEditTest < FeatureTest
  def test_user_can_cancel_making_an_edit
    seed_skills
    visit '/skills'
    assert page.has_content?("Coding is cool")
    click_on("Coding is cool")
    assert "/skills/skill.id", current_path
    click_on("Edit")
    assert "/skills/skill.id/edit", current_path
    click_on("Cancel")
    assert "/skills/skill.id", current_path
  end
end
