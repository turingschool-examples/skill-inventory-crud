class SkillInventory
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def dataset
    database.from(:skills)
  end

  def create(skill)
    dataset.insert(skill)
  end

  def all
    dataset.to_a.map { |data| Skill.new(data)  }
  end

  def find(id)
    data = dataset.where(:id => id).to_a.first
    Skill.new(data)
  end

  def update(skill, id)
    database.transaction do
      target                = database['skills'].find { |data| data["id"] == id }
      target["title"]       = skill[:title]
      target["description"] = skill[:description]
    end
  end

  def delete(id)
    database.transaction do
      database['skills'].delete_if { |data| data["id"] == id }
    end
  end

  def delete_all
    database.transaction do
      database['skills'] = []
      database['total']  = 0
    end
  end
end
