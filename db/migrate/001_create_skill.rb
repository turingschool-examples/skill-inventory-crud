require 'sequel'

environments = ["test", "development"]

environments.each do |env|
  Sequel.sqlite("db/skill_inventory_#{env}.sqlite3").create_table(:skills) do
    primary_key :id
    String :title
    String :description
  end
end
