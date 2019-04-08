class AddSerialToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :serial, :integer, null: false
  end
end
