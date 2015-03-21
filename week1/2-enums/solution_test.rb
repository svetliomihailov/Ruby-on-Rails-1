require 'minitest/autorun'

require_relative 'solution'

class EnumsTest < Minitest::Test
  def test_map
    Enums.map :direction, to: [:west, :east, :north, :south]

    assert_equal true, Enums.respond_to?(:direction), true
    assert_equal true, Enums.direction.respond_to?(:east)
    assert_equal true, Enums.direction.respond_to?(:south)
    assert_equal true, Enums.direction.respond_to?(:north)
    assert_equal true, Enums.direction.respond_to?(:west)
  end

  def test_enum_creation
    e = Enum.new :a, :b

    assert_equal true, e.respond_to?(:a)
    assert_equal true, e.respond_to?(:b)
  end

  def test_enum_invalid_craetion
    assert_raises(ArgumentError) do
      Enum.new 1
    end

    assert_raises(ArgumentError) do
      Enum.new 'bla'
    end
  end
end
