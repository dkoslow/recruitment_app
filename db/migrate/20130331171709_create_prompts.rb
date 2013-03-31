class CreatePrompts < ActiveRecord::Migration
  def change
    create_table :prompts do |t|
      t.integer :user_id
      t.string :company
      t.datetime :due_date
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
