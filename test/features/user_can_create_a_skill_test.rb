require_relative '../test_helper'

class UserCanCreateASkillTest < FeatureTest
  def test_user_can_create_skill
    visit '/'
    click_link "New"
    assert_equal "/skills/new", current_path
    fill_in "Name", with: "New skill"
    fill_in "Description", with: "New description"
    click_button("Save")
    assert_equal "/skills", current_path
    assert page.has_content?("Skills")
  end
end
