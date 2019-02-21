class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :name, index: true, unique: true, null: false
      t.string :code, index: true, unique: true, null: false
      t.jsonb :config, null: false
      t.string :domain, index: true, unique: true, null: false

      t.timestamps
    end
  end
end
