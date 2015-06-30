module Posts
  class PostBuilder
    def initialize(post_params)
      @post = Post.new post_params
    end

    def create_post
      ActiveRecord::Base.transaction do
        add_tags
        @post.save
      end

      @post
    end

    private

    def add_tags
      tf = Tags::TagFinder.new @post.content

      tf.tags.each do |tag|
        t = Tag.find_or_create_by(text: tag)
        @post.tags << t unless @post.tags.include?(t)
      end
    end
  end
end

