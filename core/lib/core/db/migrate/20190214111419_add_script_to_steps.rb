class AddScriptToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :script, :text
  end
end
