class SiteCredential < ApplicationRecord
  belongs_to :site
  belongs_to :company
  scope :for_site, ->(site_id) { where(site_id: site_id) }

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

  def connected?
    connected_at.present?
  end

  def run!
    Core::Services::Browser.new(site, dataset).run!
  end
end
