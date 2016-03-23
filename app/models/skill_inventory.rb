require 'yaml/store'
require_relative 'skill'
require 'pry'

class SkillInventory

  def self.database
    @database ||= YAML::Store.new("db/skill_inventory")
  end

  def self.all_names
    self.database
    @database.transaction do
      if @database['skills'].nil?
        "none"
      else
        @database['skills'].map do |skill|
          skill.name
        end
      end
    end
  end

  def self.add(skill_info)
    self.database
    @database.transaction do
      @database['skills'] ||= []
      id = @database['skills'].last.id + 1
      @database['skills'] << Skill.new(skill_info, id)
    end
  end

  def self.find(name)
    self.database
    result = @database.transaction do
      @database['skills'].find { |skill| skill.name == name }
    end
    if result.nil?
      Skill.new({}, 0)
    else
      result
    end
  end


  def self.update(new_info, existing_skill_name)
    self.database
    @database.transaction do
      result = @database['skills'].find { |skill| skill.name == existing_skill_name}
      result.name = new_info[:name]
      result.status = new_info[:status]
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
