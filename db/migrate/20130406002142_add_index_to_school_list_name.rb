class AddIndexToSchoolListName < ActiveRecord::Migration
  def change
    add_index :school_lists, :name
  end
end
