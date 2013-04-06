class AddIndexToCompanyListName < ActiveRecord::Migration
  def change
    add_index :company_lists, :name
  end
end
