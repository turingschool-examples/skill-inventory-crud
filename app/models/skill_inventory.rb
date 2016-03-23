require 'yaml/store'
require_relative 'skill'
require 'pry'

class SkillInventory
  def self.database
    @database ||= YAML::Store.new("db/skill_inventory")
  end

  def self.all
    self.database
    @database.transaction do
      if @database['skills'].nil?
        "none"
      else
        @database['skills'].map do |skill|
          skill.name
        end.join(", ")
      end
    end
  end

  def self.add(skill_info)
    self.database
    @database.transaction do
      @database['skills'] ||= []
      @database['skills'] << Skill.new(skill_info)
    end
  end

  def self.find(name)
    self.database
    result = @database.transaction do
      @database['skills'].find { |skill| skill.name == name }
    end
    if result.nil?
      "not that one"
    else
      result
    end
  end


  def self.update(new_info, existing_skill_name)
    self.database
    @database.transaction do
      result = @database['skills'].find { |skill| skill.name == existing_skill_name}
      result.name = new_info[:name]
    end
  end

  def self.delete(name)
    self.database
    @database.transaction do
      database['skills'].delete_if do |skill|
        skill.name == name
      end
    end
  end
end
