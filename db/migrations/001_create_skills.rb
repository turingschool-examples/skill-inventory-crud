require 'sqlite3'

environments = ["test", "development"]

environments.each do |env|
  database = SQLite3::Database.new("db/skill_inventory_#{env}.db")
  database.execute(
    "CREATE TABLE skills(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64),
      description VARCHAR(64)
    )"
  )
  puts "creating the database for #{env}"
end
