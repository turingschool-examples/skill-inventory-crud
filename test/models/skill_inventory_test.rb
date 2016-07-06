require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def skill_inventory_empty
    assert_equal 0, SkillInventory.all.count
  end

  def current_skill_id
    SkillInventory.all.first.id
  end

  def test_it_creates_a_skill
    skill_inventory_empty

    SkillInventory.create({name: "golf", description: "can golf"})

    assert_equal 1, SkillInventory.all.count

    skill = SkillInventory.find(current_skill_id)

    assert_equal "golf", skill.name
    assert_equal "can golf", skill.description
    assert_instance_of Skill, skill
  end

  def test_it_returns_all_skills
    skill_inventory_empty

    SkillInventory.create({name: "golf", description: "play golf"})
    SkillInventory.create({name: "jump rope", description: "can jump rope"})
    SkillInventory.create({name: "drive car", description: "can drive car"})

    SkillInventory.all.each do |skill|
      assert_instance_of Skill, skill
    end
  end

  def test_it_can_find_skills
    SkillInventory.create({name: "golf", description: "play golf"})

    skill = SkillInventory.find(current_skill_id)

    assert_equal "golf", skill.name
    assert_equal "play golf", skill.description
  end

  def test_it_can_update_a_skill
    SkillInventory.create({name: "golf", description: "play golf"})

    SkillInventory.update(current_skill_id, {name: "basketball", description: "play basketball"})

    skill = SkillInventory.find(current_skill_id)

    assert_equal "basketball", skill.name
    assert_equal "play basketball", skill.description
  end

  def test_destroy
    skill_inventory_empty
    SkillInventory.create({name: "jump rope", description: "can jump rope"})
    SkillInventory.destroy(current_skill_id)
    skill_inventory_empty
  end
end
