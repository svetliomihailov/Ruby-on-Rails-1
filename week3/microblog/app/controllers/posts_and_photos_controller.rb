class PostsAndPhotosController < ApplicationController
  def index
    photos = Photo.all
    posts = Post.all
    @showables = (photos + posts).sort { |x,y| y.created_at <=> x.created_at }
  end
end