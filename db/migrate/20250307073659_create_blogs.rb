class CreateBlogs < ActiveRecord::Migration[8.0]
  def change
    create_table :blogs do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
