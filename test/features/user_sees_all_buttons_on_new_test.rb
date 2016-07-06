require_relative '../test_helper'

class UserSeesAllButtonsOnNewTest < FeatureTest
  def test_user_sees_all_buttons_on_new_page
    visit '/skills/new'
    assert find('.back[href="/skills"]').visible?
    assert find('.btn[type="submit"]').visible?
  end
end
