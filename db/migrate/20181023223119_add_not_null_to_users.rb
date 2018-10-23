class AddNotNullToUsers < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :users, :first_name, :last_name, false
  end
end
