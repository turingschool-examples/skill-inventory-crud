require_relative "../test_helper"

class UserEditsSkillTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_changes_title_and_description
    data1 = {
      title:       "some title",
      description: "some description"
    }
    skill_inventory.create(data1)

    data2 = {
      title:       "another title",
      description: "another description"
    }
    skill_inventory.create(data2)

    visit '/'
    click_link("Skill Inventory")
    assert_equal '/skills', current_path
    first(:link, "Edit").click
    assert '/skills/:id/edit', current_path
    fill_in("skill[title]", with: "new skill")
    fill_in("skill[description]", with: "new description")
    click_button('submit')
    assert '/skills', current_path
    within("#skills") do
      assert page.has_content?("new skill")
    end
  end
end
