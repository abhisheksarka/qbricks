class Api::SiteCredentialsController < Api::BaseController
  before_action :load_site, only: [:create]
  before_action :load_site_credentials, only: [:update]

  def create
    sc = SiteCredential.create!(
      company: current_company,
      site: @site,
      uid: site_credential_params[:uid],
      password: site_credential_params[:password]
    )
    invoke_browser(sc.site, sc.dataset)
    sc.update_attributes!(connected_at: Time.zone.now)
    respond_with_success sc.attributes
  end

  def update
    @site_credentials.update_attributes!(
      uid: site_credential_params[:uid],
      password: site_credential_params[:password]
    )
    invoke_browser(@site_credentials.site, @site_credentials.dataset)
    @site_credentials.update_attributes!(connected_at: Time.zone.now)
    respond_with_success @site_credentials.attributes
  end

  private

  def invoke_browser(site, dataset)
    Core::Services::Browser.new(site, dataset).run!
  end

  def load_site
    @site = Site.find(site_credential_params[:site_id])
  end

  def load_site_credentials
    @site_credentials = current_company.site_credentials.find(params[:id])
  end

  def site_credential_params
    params.require(:site_credential).permit(:uid, :site_id, :password)
  end
end
