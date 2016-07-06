require_relative '../test_helper'

class UserSeesAllButtonsOnEditTest < FeatureTest
  def test_user_sees_all_buttons_on_edit_page
    seed_skills
    visit '/skills'
    click_on("Coding is cool")
    click_on("Edit")
    assert "/skills/skill.id/edit", current_path
    assert find('.back').visible?
    assert find('button[type="submit"]').visible?
  end
end
