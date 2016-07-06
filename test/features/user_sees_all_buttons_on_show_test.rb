require_relative '../test_helper'

class UserSeesAllButtonsOnShowTest < FeatureTest
  def test_user_sees_all_buttons_on_show_page
    seed_skills
    visit '/skills'
    click_on("Coding is cool")
    assert "/skills/skill.id", current_path
    assert find('.back[href="/skills"]').visible?
    assert find('.btn:nth-child(2)').visible?
  end
end
