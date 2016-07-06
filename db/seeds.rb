require 'sqlite3'
database = SQLite3::Database.new("db/skill_inventory_development.db")

database.execute("DELETE FROM skills")

database.execute(
  "INSERT INTO skills (name, description)
   VALUES
     ('Golf', 'I can golf'),
     ('Jump rope', 'I can jump rope'),
     ('Read', 'I can read'),
     ('Drive', 'I can drive a car')"
)

puts "It worked and:"
p database.execute("SELECT * FROM skills")
