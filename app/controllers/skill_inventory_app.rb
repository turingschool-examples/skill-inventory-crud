class SkillInventoryApp < Sinatra::Base
  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = skill_inventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    skill_inventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = skill_inventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    skill_inventory.update(params[:skill], id.to_i)
    redirect '/skills'
  end

  delete '/skills/:id' do |id|
    skill_inventory.delete(id.to_i)
    redirect '/skills'
  end

  not_found do
    erb :error
  end

  def skill_inventory
    if ENV["RACK_ENV"] == "test"
      database = Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      database = Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
    @skill_inventory ||= SkillInventory.new(database)
  end
end
