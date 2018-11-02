class CreateRents < ActiveRecord::Migration[5.2]
  def change
    create_table :rents do |t|
      t.references :user, foreign_key: true, null: false
      t.references :book, foreign_key: true, null: false
      t.string :start_date, null: false
      t.string :end_date, null: false

      t.timestamps
    end
  end
end
