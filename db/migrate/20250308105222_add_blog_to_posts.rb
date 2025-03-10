class AddBlogToPosts < ActiveRecord::Migration[8.0]
  def change
    add_reference :posts, :blog, null: false, foreign_key: true

    Post.all.each do |post|
      post.update(blog_id: Blog.first.id)
    end
  end
end
