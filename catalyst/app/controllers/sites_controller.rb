class SitesController < ApplicationController
  before_action :load_site, only: %i[update edit runner run]
  before_action :parse_config, only: %i[update create]
  before_action :parse_datamap, only: %i[update create]

  def edit; end

  def runner; end

  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.create!(allowed_params)
    flash[:success] = 'Site created...'
    render :new
  end

  def update
    @site.update!(allowed_params)
    flash[:success] = 'Site updated...'
    redirect_to edit_site_path(@site)
  end

  def run
    dataset = JSON.parse(params[:site][:dataset])
    Thread.new {
      Core::Services::Browser.new(@site, dataset).run!
    }
    render :runner
  end

  private

  def load_site
    @site = Site.find(params[:id])
  end

  def allowed_params
    @allowed_params ||= params
                        .require(:site)
                        .permit(
                          :name,
                          :code,
                          :domain,
                          :config,
                          :datamap,
                          :dataset
                        )
  end

  def parse_config
    allowed_params[:config] = JSON.parse(allowed_params[:config])
  end

  def parse_datamap
    allowed_params[:datamap] = JSON.parse(allowed_params[:datamap])
  end
end
