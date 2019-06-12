class CompaniesController < ApplicationController
  before_action :load_company

  def show; end

  def load_company
    @company = Company.find(params[:id])
    @users = @company.users
  end
end
