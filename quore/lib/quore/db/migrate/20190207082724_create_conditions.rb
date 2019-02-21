class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.string :expression, index: true, null: false
      t.references :conditionable, polymorphic: true, index: true, null: false
      t.timestamps
    end
  end
end
