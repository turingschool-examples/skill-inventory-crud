require 'yaml/store'
require_relative 'skill'
require 'pry'
require 'sequel'

class SkillInventory

  def self.database
    if ENV['RACK_ENV'] == "test"
      @database = Sequel.sqlite('db/skill_inventory_test.sqlite')
    else
      @database ||= Sequel.sqlite("db/skill_inventory.sqlite")
    end
  end

  def self.all
    self.database
    raw_skills = database.from(:skills).map do |raw_skill|
      Skill.new(raw_skill)
    end
  end

  def self.add(skill_info)
    self.database
    database.from(:skills).insert( :name => skill_info[:name],
                                    :status => skill_info[:status]
                                  )
    Skill.new(database.from(:skills).order(:id).last)
  end

  def self.find(id)
    self.database
    raw_result = database.from(:skills)[:id => id]
    Skill.new(raw_result)
  end


  def self.update(new_info, old_skill_id)
    self.database
    database.from(:skills).where(:id => old_skill_id).update( :name => new_info[:name],
                                                               :status => new_info[:status]
                                                              )
  end

  def self.delete(id)
    self.database
    database.from(:skills).where(:id => id).delete
  end

  def self.delete_all
    self.database
    database.from(:skills).delete
  end

end
