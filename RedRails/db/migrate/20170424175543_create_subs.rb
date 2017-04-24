class CreateSubs < ActiveRecord::Migration[5.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :user_id, null: false
      t.index :user_id 

      t.timestamps
    end
  end
end