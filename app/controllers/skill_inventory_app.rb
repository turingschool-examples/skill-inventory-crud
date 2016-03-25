require_relative '../models/skill_inventory'
require 'sinatra'
require 'pry'

class SkillInventoryApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :server, 'webrick'
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

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :skill
  end

  post '/skills' do
    SkillInventory.add(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(params[:skill], id.to_i)
    redirect "/skills/#{id}"
  end

  delete '/skills/:id' do |id|
    SkillInventory.delete(id.to_i)
    redirect '/skills'
  end
end
