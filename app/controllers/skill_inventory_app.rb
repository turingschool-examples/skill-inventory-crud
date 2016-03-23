require 'models/skill_inventory'

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :method_override, true

  not_found do
    erb :error
  end

  get '/' do
    redirect '/skills'
  end

  get '/skills' do
    @skills = SkillInventory.all
    erb :index
  end

  get '/skills/new' do
    erb :add
  end

  get '/skills/:name' do |name|
    @skill = SkillInventory.find(name.to_s)
    erb :skill
  end

  post '/skills' do
    SkillInventory.add(params[:skill])
    redirect '/skills'
  end

  get '/skills/:name/edit' do |name|
    @skill = SkillInventory.find(name.to_s)
    erb :edit
  end

  put '/skills/:name' do |name|
    SkillInventory.update(params[:skill], name.to_s)
    redirect '/skills'
  end

  delete '/skills/:name' do |name|
    SkillInventory.delete(name.to_s)
    redirect '/skills'
  end
end
