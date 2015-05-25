class TweetsController < ApplicationController
  def index
    count = params[:count].present? ? params[:count] : 10

    @semantic_tweets = RequestTweets.new(count).call
  end
end