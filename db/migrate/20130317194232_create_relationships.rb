class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :contact_id
      t.text :interest_tags
      t.text :notes

      t.timestamps
    end

    add_index :relationships, :user_id
    add_index :relationships, :contact_id
  end
end
