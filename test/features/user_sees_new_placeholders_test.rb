require_relative '../test_helper'

class UserSeesNewPlaceholdersTest < FeatureTest
  def test_user_sees_placeholders_on_new_page
    visit '/skills/new'
    assert find('[placeholder="Name"]').visible?
    assert find('[placeholder="Description"]').visible?
  end
end
