require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  # assert make sure is return true
  # refute make sure is return false
  test "draft? returns true for draft blog post" do
    assert blog_posts(:draft).draft?  # assert BlogPost.new(published_at: nil).draft?
  end

  test "draft? returns false for published blog post" do
    refute blog_posts(:published).draft? # refute BlogPost.new(published_at: 1.year.ago).draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute blog_posts(:scheduled).draft? #refute BlogPost.new(published_at: 1.year.from_now).draft?)
  end

  test "published? returns true for published blog post" do
    assert blog_posts(:published).published?
  end

  test "published? returns false for draft blog post" do
    refute blog_posts(:draft).published?
  end

  test "published? returns false for scheduled blog post" do
    refute blog_posts(:scheduled).published?
  end

  test "scheduled? returns true for scheduled blog post" do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for draft blog post" do
    refute blog_posts(:draft).scheduled?
  end

  test "scheduled? returns false for published blog post" do
    refute blog_posts(:published).scheduled?
  end
end
