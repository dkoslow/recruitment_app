class AddLocationToPrompts < ActiveRecord::Migration
  def change
    add_column :prompts, :location, :string
  end
end
