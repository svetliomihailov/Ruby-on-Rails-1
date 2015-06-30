require 'sinatra/base'
require 'active_record'
require 'action_view'

require_relative 'models/post'
require_relative 'models/tag'
require_relative 'services/tags/tag_finder'
require_relative 'services/posts/post_builder'

config = YAML.load(File.read(File.join(__dir__, '../config/database.yml')))

ActiveRecord::Base.establish_connection(
  adapter: config["development"]["adapter"],
  host: config["development"][:host],
  username: config["development"]["user"],
  password: config["development"]["password"],
  database: config["development"]["database"]
)

class Microblog < Sinatra::Base
  get '/' do
    @posts = Post.all
    erb :'/posts/index.html', locals: {posts: @posts}
  end

  get '/new' do
    erb :'/posts/form.html', locals: {post: Post.new}
  end

  get "/:id" do
    begin
      @post = Post.find params[:id]
      erb :'/posts/post.html', locals: {post: @post}
    rescue
      erb :'404.html', locals: {message: 'Post not found'}
    end
  end

  post '/new' do
    pb =  Posts::PostBuilder.new content: params[:content]
    @post = pb.create_post

    if @post.save
      'Post created!'
    else
      'Failed to create post'
    end
  end

  delete "/:id" do
    begin
      @post = Post.find params[:id]
      @post.destroy

      'Post deleted succesfully'
    rescue
      erb :'404.html', locals: {message: 'Post not found'}
    end
  end

  get "/search/:text" do
    t = Tag.find_by_text '#' + params[:text]
    @posts = t.present? ? t.posts : []

    if @posts.empty?
      "No posts containig \"\##{params[:text]}\""
    else
      erb :'/posts/index.html', locals: {posts: @posts}
    end
  end
end
