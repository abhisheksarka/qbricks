class AddCompanyIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :company, index: true, null: false
  end
end
