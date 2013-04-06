class AddPopularityToSchoolLists < ActiveRecord::Migration
  def change
    add_column :school_lists, :popularity, :integer
  end
end
