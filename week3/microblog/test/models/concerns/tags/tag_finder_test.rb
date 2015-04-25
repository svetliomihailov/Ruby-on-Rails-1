require 'test_helper'

class TagFinderTest < ActiveSupport::TestCase
  TEXT_WITH_TAGS = '#some boring #tags here...'
  TEXT_WITHOUT_TAGS = '# no tags here, just a Ruby comment'

  def extract_tags(text)
    tf = Tags::TagFinder.new text
    tf.tags
  end

  test "should find the tags in the text" do
    tags = extract_tags TEXT_WITH_TAGS

    assert tags.include?('#some')
    assert tags.include?('#tags')
  end

  test "should not find tags if there is none" do
    tags = extract_tags TEXT_WITHOUT_TAGS

    assert_equal tags.count, 0
  end
end