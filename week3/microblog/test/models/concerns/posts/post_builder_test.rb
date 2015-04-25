require 'test_helper'

class PostBuilderTest < ActiveSupport::TestCase
  TEXT_WITH_TAGS = '#some text with #some tags #here'
  TEXT_WITHOUT_TAGS = '# some text with zero tags!'
  TITLE = 'title'

  def create_post_and_tags(text)
    pb = Posts::PostBuilder.new content: text, title: TITLE
    pb.create_post
  end

  test 'should create a post with no tags' do
    post = create_post_and_tags TEXT_WITHOUT_TAGS

    assert_equal 0, post.tags.count
  end

  test 'the post should have two tags' do
    post = create_post_and_tags TEXT_WITH_TAGS

    assert_equal 2, post.tags.count
    assert post.tags[0].persisted?
    assert post.tags[1].persisted?
  end
end