class TweetWorker
  include Sidekiq::Worker

  def perform(tweet_id)
    sleep(10)
    tweet = Tweet.find(tweet_id)
    user = tweet.user
    user.twitter_client.update(tweet.status)
    # set up Twitter OAuth client here
    # actually make API call
    # Note: this does not have access to controller/view helpers
    # You'll have to re-initialize everything inside here
  end
end