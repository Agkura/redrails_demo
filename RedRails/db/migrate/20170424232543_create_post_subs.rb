class CreatePostSubs < ActiveRecord::Migration[5.0]
  def change
    create_table :post_subs do |t|
      t.integer :post_id, null: false
      t.integer :sub_id, null: false
      t.index :post_id
      t.index :sub_id

      t.timestamps
    end
    add_index :post_subs, [:sub_id, :post_id], unique: true 
  end
end
