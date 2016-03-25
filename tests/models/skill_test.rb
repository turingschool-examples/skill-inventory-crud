require_relative "../test_helper"

class SkillTest < Minitest::Test

  def test_can_create_a_skill
    raw_skill = { name: "hello", status: "yes" }
    id = 1

    skill = Skill.new(raw_skill, id)

    assert_equal "hello", skill.name
    assert_equal "yes", skill.status
    assert_equal 1, skill.id
  end

end
