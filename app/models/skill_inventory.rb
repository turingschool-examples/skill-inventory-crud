class SkillInventory
  def self.database
    @database ||= YAML::Store.new("db/skill_inventory")
  end
end
