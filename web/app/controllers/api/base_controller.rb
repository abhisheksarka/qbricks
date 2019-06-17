class Api::BaseController < ActionController::Base
  before_action :authenticate_user!
end
