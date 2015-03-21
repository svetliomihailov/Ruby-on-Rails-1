class Object
  def blank?
    return true if check_empty?
    return true if falsy?

    false
  end

  def present?
    !blank?
  end

  def presence
    return self if present?
    nil
  end

  def try(method = nil, &block)
    return self if nil?

    if method.nil?
      instance_eval(&block) if block_given?
    else
      send method
    end
  end

  private

  def check_empty?
    return empty_string? if is_a?(String)
    return empty? if respond_to?(:empty?)

    false
  end

  def falsy?
    return true if nil?
    return true if self == false

    false
  end

  def empty_string?
    gsub(/\s/, '').empty?
  end
end

class String
  def inquiry
    StringInquirer.new self
  end
end

class StringInquirer
  def initialize(string)
    @string = string
  end

  def method_missing(symbol, *args)
    if symbol.to_s.match(/.+\?/)
      symbol.to_s.chop.eql? @string
    else
      super
    end
  end
end
