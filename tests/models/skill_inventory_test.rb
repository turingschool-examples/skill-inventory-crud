require_relative "../test_helper"

class SkillInventoryTest < Minitest::Test

  include TestHelpers

  def test_all_returns_all_skills
    make_skills
    skills = SkillInventory.all

    assert_equal Array, skills.class
    assert_equal 4, skills.count
    assert_equal "Skill1", skills.first.name
    assert_equal "Skill4", skills.last.name
  end

  def test_add_makes_a_new_skill
    raw_skill = { name: "hello", status: "yes" }
    SkillInventory.add(raw_skill)

    assert_equal Skill, SkillInventory.all.first.class
    assert_equal "hello", SkillInventory.all.first.name
    assert_equal "yes", SkillInventory.all.first.status
    assert_equal 1, SkillInventory.all.first.id
  end

  def test_find_finds_a_skill
    make_skills
    skill = SkillInventory.find(3)

    assert_equal Skill, skill.class
    assert_equal 3, skill.id
  end

  def test_can_update_a_skill
    make_skills
    skill = SkillInventory.find(4)

    assert_equal "Skill4", skill.name
    assert_equal "Status 4", skill.status
    assert_equal 4, skill.id

    SkillInventory.update({ :name => "updated name",
                            :status => "updated status"
                          }, 4)

    updated_skill = SkillInventory.find(4)

    assert_equal "updated name", updated_skill.name
    assert_equal "updated status", updated_skill.status
    assert_equal 4, updated_skill.id
  end

  def test_can_delete_a_skill
    make_skills

    existing_skill = SkillInventory.find(1)
    assert SkillInventory.all.any? { |skill| skill.id == existing_skill.id }
    assert_equal 4, SkillInventory.all.count

    SkillInventory.delete(1)

    deleted_skill = SkillInventory.find(1)
    refute SkillInventory.all.any? { |skill| skill.id == deleted_skill.id }
    assert_equal 3, SkillInventory.all.count
  end

end
