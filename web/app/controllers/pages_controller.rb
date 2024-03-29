class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'landing', only: [:index]
  layout 'application', only: [:home]

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
