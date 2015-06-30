module Tags
  class TagFinder
    def initialize(text)
      @text = text
    end

    def tags
      @text.scan Tag::TAG_REG_EX
    end
  end
end
