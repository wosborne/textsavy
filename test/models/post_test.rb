require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "valid post" do
    action_text = ActionText::Content.new("Valid post content")
    post = Post.new(title: "Valid Post", content: action_text)
    assert post.valid?
  end

  test "invalid without title" do
    action_text = ActionText::Content.new("Valid post content")
    post = Post.new(title: "")
    assert_not post.valid?
  end

  test "invalid without content" do
    action_text = ActionText::Content.new("")
    post = Post.new(title: "Valid Title")
    assert_not post.valid?
  end
end
