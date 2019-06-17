class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_company
    @current_company ||= current_user.company
  end
end

