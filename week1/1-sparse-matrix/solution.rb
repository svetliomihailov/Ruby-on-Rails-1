module TarjanMatrix
  def compress
    TarjanMatrixCompressor.new(self).compress
  end

  class TarjanMatrixCompressor
    def initialize(array)
      @array = array
      @compressed_matrix = []
    end

    def compress
      @array.each { |row| insert_row_packages(packages_from_row(row)) }
      @compressed_matrix
    end

    private

    def packages_from_row(row)
      row.each_with_index.map { |e, i| Package.new(i, e) unless e.nil? }.compact
    end

    def find_row_offset(row)
      offset = 0

      loop do
        return offset if row_fits?(row, offset)
        offset += 1
      end
    end

    def row_fits?(row, offset)
      row.each { |p| return false if @compressed_matrix[p.index + offset] }

      true
    end

    def insert_row_packages(row_packages)
      offset = find_row_offset row_packages
      row_packages.each { |p| @compressed_matrix[p.index + offset] = p.to_a }
    end
  end

  Package = Struct.new(:index, :value) do
    def to_a
      [index, value]
    end
  end
end

class Array
  include TarjanMatrix
end
