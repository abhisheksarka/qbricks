class SitesController < ApplicationController
  before_action :load_site, only: [:update, :edit]
  before_action :parse_config, only: [:update, :create]

  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = Site.find_or_create_by!(allowed_params)
    flash[:success] = "Site created..."
    render :new
  end

  def update
    @site.update_attributes!(allowed_params)
    flash[:success] = "Site updated..."
    redirect_to edit_site_path(@site)
  end

  private

  def load_site
    @site = Site.find(params[:id])
  end

  def allowed_params
    @allowed_params ||= params.require(:site).permit(:name, :code, :config, :domain)
  end

  def parse_config
    allowed_params[:config] = JSON.parse(allowed_params[:config])
  end
end
