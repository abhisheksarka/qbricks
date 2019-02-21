class CreateFlows < ActiveRecord::Migration[5.2]
  def change
    create_table :flows do |t|
      t.references :site, foreign_key: true, null: false
      t.string :name, index: true, null: false
      t.timestamps
    end
  end
end
 