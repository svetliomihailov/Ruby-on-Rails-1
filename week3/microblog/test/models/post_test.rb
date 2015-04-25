require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def create_post(params)
    Post.new params
  end

  test 'post is valid' do
    p = create_post content: 'some text', title: 'title'

    assert p.valid?
  end

  test 'post is invalid - content missing' do
    p = create_post content: '', title: 'title'

    assert_not p.valid?
  end

  test 'post is invalid - title missing' do
    p = create_post content: 'contents', title: ''

    assert_not p.valid?
  end
end
