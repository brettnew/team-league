require('pg')
require('pry')
require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/team")
require("./lib/player")
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
  @team = Team.find(params.fetch("id").to_i())
  @teams = Team.all()
  erb(:team_edit)
end

delete('/teams/:id') do
  team = Team.find(params.fetch("id").to_i())
  team.destroy()
  @teams = Team.all()
  erb(:team)
end
