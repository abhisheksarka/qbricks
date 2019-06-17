class CreateSiteCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :site_credentials do |t|
      t.references :site, foreign_key: true, null: false
      t.references :company, foreign_key: true, null: false
      t.string :uid, index: true, null: false
      t.string :password, null: false

      t.timestamps
      t.index %i[company_id site_id], unique: true
    end
  end
end
