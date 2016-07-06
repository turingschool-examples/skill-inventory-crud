require_relative '../test_helper'

class UserCanCancelANewSkillTest < FeatureTest
  def test_user_can_cancel_adding_a_new_skill
    seed_skills
    visit '/skills'
    click_on("New")
    assert '/skills/new', current_path
    click_on("Cancel")
    assert '/skills', current_path
  end
end
