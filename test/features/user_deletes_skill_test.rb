require_relative '../test_helper'

class UserDeletesSkillTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def test_existing_task_is_deleted
    data1 = {
      title: 'some skill',
      description: 'some description'
    }
    data2 = {
      title: 'another skill',
      description: 'another description'
    }
    skill_inventory.create(data1)
    skill_inventory.create(data2)

    visit '/'
    click_link("Skill Inventory")
    assert '/skills', current_path
    first(:button, "Delete").click
    assert '/skills', current_path
    # expect that deleted skill is no longer visible
    within "#skills" do
      refute has_content? "some skill"
      assert has_content? "another skill"
    end
  end
end
