module TwitterService
  class Api
    USER_TWEETS_URL = "https://api.twitter.com/1.1/statuses/user_timeline.json"
    HOME_TWEETS_URL = "https://api.twitter.com/1.1/statuses/user_timeline.json?count=2"

    def initialize(oauth_token, oauth_token_secret, api_key, api_secret)
      @oauth_token = oauth_token
      @oauth_token_secret = oauth_token_secret
      @api_key = api_key
      @api_secret = api_secret
    end

    def user_tweets(count)
      prepare_access_token

      tweets = @access_token.get USER_TWEETS_URL + "?count=#{count}"
      JSON.parse tweets.body
    end

    private

    def prepare_access_token
      return if @access_token.present?

      consumer = OAuth::Consumer.new @api_key, @api_secret, consumer_hash

      @access_token = OAuth::AccessToken.from_hash consumer, token_hash
    end

    def token_hash
      {
        oauth_token: @oauth_token,
        oauth_token_secret: @oauth_token_secret
      }
    end

    def consumer_hash
      {
        site: "https://api.twitter.com",
        scheme: :header
      }
    end
  end
end