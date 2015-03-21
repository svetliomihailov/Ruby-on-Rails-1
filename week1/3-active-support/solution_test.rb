require 'minitest/autorun'

require_relative 'solution'

class ObjecBlanktTest < Minitest::Test
  def test_for_nil_and_false
    assert_equal true, false.blank?
    assert_equal true, nil.blank?
    assert_equal false, true.blank?
  end

  def test_for_empyty_objects
    assert_equal true, [].blank?
    assert_equal true, {}.blank?
    assert_equal false, [1, 2].blank?
    assert_equal true, ''.blank?
  end

  def test_white_spaces
    assert_equal true, '    '.blank?
  end
end

class ObjectPresentTest < Minitest::Test
  def test_for_nil_and_false
    assert_equal true, true.present?
    assert_equal false, false.present?
    assert_equal false, nil.present?
  end

  def test_for_non_empty_objects
    assert_equal false, [].present?
    assert_equal false, {}.present?
    assert_equal true, [1, 2].present?
    assert_equal false, ''.present?
    assert_equal true, { a: 2 }.present?
  end
end

class ObjectPresenceTest < Minitest::Test
  def test_presence
    assert_equal true, true.presence
    assert_equal nil, [].presence
    assert_equal [1, 2], [1, 2].presence
  end
end

class ObjectTryTest < Minitest::Test
  def test_try_on_nil_object
    assert_equal nil, nil.try(:to_s)
  end

  def test_try_with_block
    assert_equal 3, 1.try { |o| o.succ + 1 }
    assert_equal 2, 1.try { succ }
    assert_equal 2, 1.try(&:succ)
  end

  def test_try_with_valid_object
    assert_equal 2, 1.try(:succ)
  end

  def test_no_method_and_blocks_given
    assert_equal nil, 1.try
  end
end

class StringInquirerTest < Minitest::Test
  def test_check_for_string
    str_inq = StringInquirer.new 'bla'

    assert_equal true,  str_inq.bla?
    assert_equal false, str_inq.blabla?
  end

  def test_method_missing_super
    str_inq = StringInquirer.new 'bla'

    assert_raises(NoMethodError) { str_inq.bla }
  end

  def test_string_convert_to_string_inquirer
    assert_equal true, 'bla'.inquiry.bla?
    assert_equal false, 'bla'.inquiry.blabla?
  end
end
