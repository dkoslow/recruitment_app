class CreateCompanyLists < ActiveRecord::Migration
  def change
    create_table :company_lists do |t|
      t.string :name

      t.timestamps
    end
  end
end
