class PagesController < ApplicationController
  layout 'landing'
  def sign_in; end
  def sign_up; end

  def index
    render :sign_in
  end
end
