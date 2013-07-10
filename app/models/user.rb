class User < ActiveRecord::Base
  has_many :tweets

  def twitter_client
    @twitter_client ||= Twitter::Client.new(oauth_token: self.oauth_token, oauth_token_secret: self.oauth_secret)
  end

  def tweet(status)
    tweet = tweets.create!(:status => status)
    # Tweet.create!(status: status, :user => self.id)
    TweetWorker.perform_async(tweet.id)
  end
end
