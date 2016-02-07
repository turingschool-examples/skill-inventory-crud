require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def create_skills
    num.times do |i|
      skill_inventory.create(
        title:       "title#{i+1}",
        description: "description#{i+1}"
      )
    end
  end

  def test_it_creates_a_skill
    data = {
      :title => "a title",
      :description => "a description"
    }
    skill_inventory.create(data)
    skill = skill_inventory.all.last
    assert skill.id
    assert_equal "a title", skill.title
    assert_equal "a description", skill.description
  end
  #
  # def test_can_get_all_skills
  #   create_skills
  #   skills = skill_inventory.all
  #
  #   assert_equal 2, skills.count
  #   assert_equal "a title", skills[0].title
  #   assert_equal "a description", skills[0].description
  #   assert_equal "another title", skills[1].title
  #   assert_equal "another description", skills[1].description
  # end
  #
  # def test_can_find_skill_by_id
  #   create_skills
  #   skill = skill_inventory.find(1)
  #   assert_equal "a title", skill.title
  #   assert_equal "a description", skill.description
  # end
  #
  # def test_can_update_existing_skill_data
  #   create_skills
  #   data_new = {
  #     :title => "new skill",
  #     :description => "new description"
  #   }
  #   skill_inventory.update(data_new, 1)
  #   skill = skill_inventory.find(1)
  #   assert_equal "new skill", skill.title
  #   assert_equal "new description", skill.description
  # end
  #
  # def test_can_delete_skill_by_id
  #   create_skills
  #   assert_equal 2, skill_inventory.all.count
  #   skill_inventory.delete(1)
  #   assert_equal 1, skill_inventory.all.count
  # end
end
