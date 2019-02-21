class CreateDatasets < ActiveRecord::Migration[5.2]
  def change
    create_table :datasets do |t|
      t.jsonb :content
      t.string :type
      t.references :site, foreign_key: true

      t.timestamps
    end
  end
end
