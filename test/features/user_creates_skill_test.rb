require_relative '../test_helper'

class UserCreatesSkillTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_with_valid_attributes
    visit '/'
    click_link("New Skill")
    assert_equal '/skills/new', current_path
    fill_in("skill[title]", with: "my first skill")
    fill_in("skill[description]", with: "description of the skill")
    click_button("Create New Skill")
    assert_equal '/skills', current_path
    within("#skills") do
      assert page.has_content?("my first skill")
    end
  end

end
