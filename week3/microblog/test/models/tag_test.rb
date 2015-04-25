require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def create_tag(params)
    Tag.new params
  end

  test 'tag text is valid' do
    t = create_tag text: '#tag'
    
    assert t.valid?
  end

  test "tag's text is not the correct format" do
    t = create_tag text: '232'
    
    assert_not t.valid?
  end

  test "tag's text is missing" do
    t = create_tag text: ''
    
    assert_not t.valid?
  end
end
