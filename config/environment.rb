require 'bundler'
Bundler.require

$db = SQLite3::Database.new("db/skill_inventory_#{ENV['RACK_ENV']}.db")
$db.results_as_hash = true

APP_ROOT = File.expand_path('..', __dir__)

class SkillInventoryApp < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, 'app', 'views')
  set :public_folder, File.join(APP_ROOT, 'app', 'public')
end

Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }

Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }
