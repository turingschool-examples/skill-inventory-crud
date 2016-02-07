require_relative '../test_helper'

class SkillTest < Minitest::Test
  def test_assigns_attributes_correctly
    data = {
      "id" => 1,
      "title" => "some skill",
      "description" => "some description"
    }
    skill = Skill.new(data)
    assert_equal 1, skill.id
    assert_equal "some skill", skill.title
    assert_equal "some description", skill.description
  end
end
