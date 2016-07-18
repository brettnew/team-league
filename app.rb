require('pg')
require('pry')
require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/team")
require("./lib/player")
require "./lib/team_coordinator"
also_reload("lib/**/*.rb")

get('/') do
  erb(:index)
end

get('/teams/all') do
  @teams = Team.all()
  erb(:team)
end

get('/players/all') do
  @players = Player.all()
  erb(:player)
end

post('/teams') do
  name = params.fetch('name')
  @team = Team.create({:name => name, :id => nil})
  @teams = Team.all()
  erb(:team)
end

get('/teams/:id') do
  id = params.fetch("id").to_i()
  @team = Team.find(id)
  @teams = Team.all()
  @coordinator = TeamCoordinator.find_by(team_id: id)
  erb(:team_edit)
end

delete('/teams/:id') do
  team = Team.find(params.fetch("id").to_i())
  team.destroy()
  @teams = Team.all()
  erb(:team)
end

patch('/teams/:id') do
  team = Team.find(params.fetch("id").to_i())
  name = params.fetch("name")
  team.update({:name => name})
  @teams = Team.all()
  erb(:team)
end

post("/coordinators") do
  name = params.fetch("coordinator_name")
  team_id = params.fetch("team_id").to_i()
  @coordinator = TeamCoordinator.create({:name => name, :team_id => team_id})
  @team = Team.find(team_id)
  @teams = Team.all()
  erb(:team_edit)
end

post('/players') do
  name = params.fetch('name')
  @player = Player.create({:name => name, :team_id => nil, :id => nil})
  @players = Player.all()
  erb(:player)
end

get('/players/:id') do
  id = params.fetch("id").to_i()
  @player = Player.find(id)
  @players = Player.all()
  erb(:player_edit)
end

delete('/players/:id') do
  player = Player.find(params.fetch("id").to_i())
  player.destroy()
  @players = Player.all()
  erb(:player)
end

patch('/players/:id') do
  player = Player.find(params.fetch("id").to_i())
  name = params.fetch("name")
  player.update({:name => name})
  @players = Player.all()
  erb(:player)
end
