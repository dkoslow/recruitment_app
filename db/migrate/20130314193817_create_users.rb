class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :company
      t.string :school
      t.string :current_location

      t.timestamps
    end
  end
end
