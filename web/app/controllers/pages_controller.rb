class PagesController < ApplicationController
  layout 'landing'

  def index
    redirect_to new_user_registration_path
  end
end
