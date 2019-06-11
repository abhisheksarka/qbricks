class PagesController < ApplicationController
  layout 'landing'

  def index
    if current_user
      render :home
    else
      redirect_to new_user_registration_path
    end
  end

  def home
  end
end
