class Player < Flexirest::Base
  base_url "http://api.football-data.org/v1"  
  get :find, "/teams/:id/players"
end