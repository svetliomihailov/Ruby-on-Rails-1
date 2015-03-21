class Enums
  class << self
    def map(enum_name, to: [])
      instance_eval <<-EOT
        def #{enum_name}
          @#{enum_name} ||= Enum.new #{to}
        end
        EOT
    end
  end
end

class Enum
  def initialize(*enums)
    enums.flatten.each do |e|
      verify e
      self.class.send(:define_method, e) { e }
    end
  end

  private

  def verify(arg)
    fail ArgumentError, 'invalid arguments' unless arg.is_a? Symbol
  end
end
