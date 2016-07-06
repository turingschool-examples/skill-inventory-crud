class Skill
  attr_reader :name,
              :description,
              :id

  def initialize(data)
    @id           = data["id"]
    @name         = data["name"]
    @description  = data["description"]
  end
end
