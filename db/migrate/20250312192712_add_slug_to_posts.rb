class AddSlugToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true

    Post.find_each(&:save)
  end
end
