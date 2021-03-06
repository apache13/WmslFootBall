class Player < Flexirest::Base
  base_url "http://api.football-data.org/v1"  
  get :find, "/teams/:id/players"
  
  before_request do |name, request|
    request.headers["X-Auth-Token"] = Config.find_by_key('API_AUTH_TOKEN').value 
  end
  
end