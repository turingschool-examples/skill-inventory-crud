class Skill
  attr_reader :title,
              :description,
              :id

  def initialize(data)
    @id           = data[:id]
    @title        = data[:title]
    @description  = data[:description]
  end
end
