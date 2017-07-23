class OverviewController < ApplicationController
  
  before_action :require_login_permission
  
  def index
  end
end
