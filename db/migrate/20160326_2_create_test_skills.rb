require 'sequel'

database = Sequel.sqlite('db/skill_inventory_test.sqlite')
database.create_table :skills do
  primary_key :id
  String      :name
  String      :status
end
