class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.integer :user_id
      t.boolean :archived

      t.timestamps
    end
  end
end
