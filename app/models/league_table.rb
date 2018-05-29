class LeagueTable < Flexirest::Base
  base_url "http://api.football-data.org/v1"  
  get :find, "/competitions/:id/leagueTable"
end