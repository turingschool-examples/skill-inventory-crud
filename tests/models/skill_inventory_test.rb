require_relative "../test_helper"

class SkillInventoryTest < Minitest::Test

  include TestHelpers

  def test_all_returns_all_skills
    make_skills
    skills = SkillInventory.all

    assert_equal 4, skills.count
    assert_equal "Skill1", skills.first.name
    assert_equal "Skill4", skills.last.name
  end

  def test_add_makes_a_new_skill
    raw_skill = { name: "hello", status: "yes" }
    pre_count = SkillInventory.database.from(:skills).count

    skill = SkillInventory.add(raw_skill)
    post_count = SkillInventory.database.from(:skills).count

    assert_equal "hello", skill.name
    assert_equal "yes", skill.status
    assert_equal 1, post_count - pre_count
  end

  def test_find_finds_a_skill
    make_skills
    dataset = SkillInventory.database.from(:skills).order(:id)
    target = Skill.new(dataset.last)
    target_id = target.id

    result = SkillInventory.find(target.id)

    assert_equal "Skill4", result.name
  end

  def test_can_update_a_skill
    make_skills
    dataset = SkillInventory.database.from(:skills).order(:id)
    target = Skill.new(dataset.last)
    target_id = target.id

    old_skill = SkillInventory.find(target.id)

    assert_equal "Skill4", old_skill.name
    assert_equal "Status 4", old_skill.status

    SkillInventory.update({ :name => "updated name",
                            :status => "updated status"
                          }, target_id)

    updated_skill = SkillInventory.find(target_id)

    assert_equal "updated name", updated_skill.name
    assert_equal "updated status", updated_skill.status
    assert_equal target_id, updated_skill.id
  end

  def test_can_delete_a_skill
    make_skills

    dataset = SkillInventory.database.from(:skills).order(:id)
    target = Skill.new(dataset.last)
    target_id = target.id

    old_skill = SkillInventory.find(target.id)
    more_skills_count = SkillInventory.all.count

    assert_equal "Skill4", old_skill.name
    assert_equal "Status 4", old_skill.status
    assert_equal 4, SkillInventory.all.count

    SkillInventory.delete(target_id)

    refute SkillInventory.all.any? { |skill| skill.id == target_id }
    assert_equal 3, SkillInventory.all.count
  end

end
