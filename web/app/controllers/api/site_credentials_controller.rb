class Api::SiteCredentialsController < Api::BaseController
  before_action :load_site, only: [:create]
  before_action :load_site_credentials, only: [:update]

  def create
    binding.pry
    sc = SiteCredential.create!(
      company: current_company,
      site: @site,
      uid: site_credential_params[:uid],
      password: site_credential_params[:password]
    )
    Core::Services::Browser.new(@site, sc.dataset).run!
    respond_with_success(sc.attributes)
  end

  def update
    ""
    binding.pry
    respond_with_success {}
  end

  private

  def load_site
    @site = Site.find(params[:site_id])
  end

  def load_site_credentials
    @site_credentials = current_company.site_credentials.find(params[:id])
  end

  def site_credential_params
    params.require(:site_credentials).permit(:uid, :site_id, :password)
  end
end
