class AddSerialToFlowSteps < ActiveRecord::Migration[5.2]
  def change
    remove_column :steps, :serial
    add_column :flows_steps, :serial, :integer, index: true
  end
end
