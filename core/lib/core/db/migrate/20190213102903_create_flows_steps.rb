class CreateFlowsSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :flows_steps do |t|
      t.references :flow, foreign_key: true
      t.references :step, foreign_key: true

      t.timestamps
    end
  end
end
