class ModifySerialFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :flows_steps, :serial, :float, index: true
  end
end
