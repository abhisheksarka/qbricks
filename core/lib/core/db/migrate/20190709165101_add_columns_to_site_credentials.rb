class AddColumnsToSiteCredentials < ActiveRecord::Migration[5.2]
  def change
    add_column :site_credentials, :connected_at, :datetime
  end
end
