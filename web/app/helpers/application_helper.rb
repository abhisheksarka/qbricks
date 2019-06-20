module ApplicationHelper
  def resource_name
    :user
  end

  def resource_class
    User
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def flash_class(level)
    case level
    when :notice
      then 'alert alert-info'
    when :success
      then 'alert alert-success'
    when :error
      then 'alert alert-danger'
    when :alert
      then 'alert alert-warning'
    else
      'alert alert-info'
    end
  end

  def current_company
    @current_company ||= current_user.company
  end

  def site_credential_for(site)
    current_company
      .site_credentials
      .for_site(site.id)
      .last || SiteCredential.new(company: current_company, site: site)
  end
end
