require 'sqlite3'

class SkillInventory
  def self.create(skill)
    $db.execute("INSERT INTO skills (name, description)
      VALUES (?, ?)", skill[:name], skill[:description])
  end

  def self.raw_skills
    $db.execute("SELECT * FROM skills")
  end

  def self.all
    raw_skills.map { |data| Skill.new(data) }
  end

  def self.raw_skill(id)
    raw_skills.find { |skill| skill["id"] == id }
  end

  def self.find(id)
    Skill.new(raw_skill(id))
  end

  def self.update(id, skill)
    $db.execute("UPDATE skills SET name= ?,
      description= ? WHERE id = ?", skill[:name], skill[:description], id)
  end

  def self.destroy(id)
    $db.execute("DELETE FROM skills WHERE id = ?", id)
  end

  def self.delete_all
    $db.execute("DELETE FROM skills")
  end
end
