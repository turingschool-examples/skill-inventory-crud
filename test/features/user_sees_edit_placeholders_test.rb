require_relative '../test_helper'

class UserSeesEditPlaceholdersTest < FeatureTest
  def test_user_sees_placeholders_on_edit_page
    seed_skills
    visit '/skills'
    find('li:first').click_on("Coding is cool")
    click_on("Edit")
    assert "/skills/skill.id/edit", current_path
    assert find('[placeholder="Name"]').visible?
    assert find('[placeholder="Description"]').visible?
  end
end
