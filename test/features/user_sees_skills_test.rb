require_relative '../test_helper'

class UserSeesSkillsTest < FeatureTest
  def test_user_sees_index_of_skills
    seed_skills
    visit '/skills'
    assert page.has_content?("Coding is cool")
    assert page.has_content?("Learn capybara")
  end
end
