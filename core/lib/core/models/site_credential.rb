class SiteCredential < ApplicationRecord
  belongs_to :site
  belongs_to :company
end
