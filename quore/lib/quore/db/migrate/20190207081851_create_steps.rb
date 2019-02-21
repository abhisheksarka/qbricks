class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :site, foreign_key: true, null: false
      t.string :name, index: true, null: false
      t.string :step_type, index: true, null: false
      t.jsonb :config, null: false
      t.timestamps
    end
  end
end
