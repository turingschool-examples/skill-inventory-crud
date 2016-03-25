require 'yaml/store'
require_relative 'skill'
require 'pry'

class SkillInventory

  def self.database
    if ENV['RACK_ENV'] == "test"
      @database = YAML::Store.new('db/skill_inventory_test')
    else
      @database ||= YAML::Store.new("db/skill_inventory")
    end
  end

  def self.all
    self.database
    @database.transaction do
      @database['skills']
    end
  end

  def self.add(skill_info)
    self.database
    @database.transaction do
      @database['skills'] ||= []
      if @database["skills"] == []
        id = 1
      else
        id = @database['skills'].last.id + 1
      end
      @database['skills'] << Skill.new(skill_info, id)
    end
  end

  def self.find(id)
    self.database
    result = @database.transaction do
      @database['skills'].find { |skill| skill.id == id }
    end
    if result.nil?
      Skill.new({}, 0)
    else
      result
    end
  end


  def self.update(new_info, existing_skill_id)
    self.database
    @database.transaction do
      result = @database['skills'].find { |skill| skill.id == existing_skill_id}
      result.name = new_info[:name]
      result.status = new_info[:status]
    end
  end

  def self.delete(id)
    self.database
    @database.transaction do
      @database['skills'].delete_if do |skill|
        skill.id == id
      end
    end
  end

  def self.delete_all
    @database.transaction do
      @database["skills"] = []
    end
  end

end
