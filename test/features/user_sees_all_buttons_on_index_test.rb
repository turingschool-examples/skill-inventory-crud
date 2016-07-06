require_relative '../test_helper'

class UserSeesAllButtonsOnIndexTest < FeatureTest
  def test_user_sees_all_buttons_on_index_page
    seed_skills
    visit '/skills'
    assert find('header .btn[href="/skills/new"]').visible?
    assert find('li:nth-child(odd) .btn[type="submit"]').visible?
    assert find('li:nth-child(even) .btn[type="submit"]').visible?
  end
end
