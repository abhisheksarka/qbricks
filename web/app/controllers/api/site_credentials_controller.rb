class SiteCredentialsController < Api::BaseController
  before_action :load_site

  def create
    sc = SiteCredential.create!(
      company: current_company,
      site: @site,
      uid: create_params[:uid],
      password: create_params[:password]
    )
  end

  private

  def load_site
    @site = Site.find(params[:site_id])
  end

  def create_params
    params.require(:site_credentials).permit(:uid, :site_id, :password)
  end
end
