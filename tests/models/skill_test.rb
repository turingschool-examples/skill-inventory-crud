require_relative "../test_helper"

class SkillTest < Minitest::Test

  def test_can_create_a_skill
    raw_skill = { name: "hello", status: "yahoo" }

    skill = Skill.new(raw_skill)

    assert_equal "hello", skill.name
    assert_equal "yahoo", skill.status
  end

end
