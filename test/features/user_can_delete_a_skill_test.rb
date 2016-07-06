require_relative '../test_helper'

class UserCanDeleteASkillTest < FeatureTest
  def test_user_can_delete_a_skill
    seed_skills
    visit '/skills'
    assert page.has_content?("Coding is cool")
    find('li:first').click_on('Delete')
    refute page.has_content?("Coding is cool")
  end
end
