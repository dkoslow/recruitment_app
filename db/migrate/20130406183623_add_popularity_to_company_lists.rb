class AddPopularityToCompanyLists < ActiveRecord::Migration
  def change
    add_column :company_lists, :popularity, :integer
  end
end
