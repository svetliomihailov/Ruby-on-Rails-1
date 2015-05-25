class RequestTweets
  def initialize(count)
    @twitter_api = TwitterService::Api.new(
      TwitterService::Constants::TOKEN,
      TwitterService::Constants::TOKEN_SECRET,
      TwitterService::Constants::API_KEY,
      TwitterService::Constants::API_SECRET
    )

    @count = count
  end

  def call
    tweets = @twitter_api.user_tweets(@count)

    semantria(tweets.map { |t| t['text'] })
  end

  private

  def semantria(texts)
    semantria_api = SemantriaService::Api.new(
      SemantriaService::Constants::API_KEY,
      SemantriaService::Constants::API_SECRET,
      SemantriaService::Constants::APPLICATION_NAME,
      texts
    ).semantria_result
  end
end