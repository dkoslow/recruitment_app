class CreateSchoolLists < ActiveRecord::Migration
  def change
    create_table :school_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
