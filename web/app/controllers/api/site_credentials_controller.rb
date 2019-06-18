class SiteCredentialsController < Api::BaseController
  before_action :load_site

  def create
    binding.pry
    sc = SiteCredential.create!(
      company: current_company,
      site: @site,
      uid: create_params[:uid],
      password: create_params[:password]
    )
    Core::Services::Browser.new(@site, sc.dataset).run!
    respond_with_success(sc.attributes)
  end

  private

  def load_site
    @site = Site.find(params[:site_id])
  end

  def create_params
    params.require(:site_credentials).permit(:uid, :site_id, :password)
  end
end
