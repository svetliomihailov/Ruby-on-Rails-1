require 'minitest/autorun'

require_relative 'solution'

class SolutionTest < Minitest::Test
  TEST_MATRIX = [
    [1, nil, nil, nil],
    [nil, 2, 5, nil],
    [6, nil, nil, 7],
    [nil, 3, nil, 4]
  ]

  COMPRESSED_TEST_MATRIX = [
    [0, 1], [1, 2], [2, 5], [0, 6],
    nil, [1, 3], [3, 7], [3, 4]
  ]

  TEST_MATRIX_2 = [
    [1, nil, 2, nil],
    [nil, 2, nil, 4],
    [6, nil, nil, 8],
    [nil, nil, nil, 1]
  ]

  COMPRESSED_TEST_MATRIX_2 = [
    [0, 1], [1, 2], [2, 2], [3, 4],
    [0, 6], [3, 1], nil, [3, 8]
  ]

  def print_result(result)
    count = result.inspect.length
    print_delimeter count
    puts result.inspect
    print_delimeter count
  end

  def print_delimeter(char_count)
    char_count.times { print '-' }
    print "\n"
  end

  def test_compress_method
    assert_equal COMPRESSED_TEST_MATRIX, TEST_MATRIX.compress
    print_result TEST_MATRIX.compress

    assert_equal COMPRESSED_TEST_MATRIX_2, TEST_MATRIX_2.compress
    print_result TEST_MATRIX_2.compress
  end
end
