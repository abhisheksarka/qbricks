class CreateDatamaps < ActiveRecord::Migration[5.2]
  def change
    create_table :datamaps do |t|
      t.jsonb :content
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
