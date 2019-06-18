class SiteCredential < ApplicationRecord
  belongs_to :site
  belongs_to :company

  def dataset
    {
      meta: {
        only_auth: true
      },
      auth: {
        uid: uid,
        pwd: password
      }
    }
  end

  def run!
    Core::Services::Browser.new(site, dataset).run!
  end
end
