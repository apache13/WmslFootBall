class PrivacyController < ApplicationController
  def index
    @app = Config.find_by_key('TITLE_STRING').value
  end
end
