class AddEmailToGhosts < ActiveRecord::Migration
  def change
    add_column :ghosts, :email, :string
  end
end
