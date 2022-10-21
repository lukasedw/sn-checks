require "rails_helper"

RSpec.describe TwitterTweetsService do
  describe "Success call", vcr: { cassette_name: "twitter_tweets/success" } do
    it "returns the username" do
      expect(subject.call[0]["username"]).to eq("@GuyEndoreKaiser")
    end
    it "returns the tweet" do
      expect(subject.call[0]["tweet"]).to eq("If you live to be 100, you should make up some fake reason why, just to mess with people... like claim you ate a pinecone every single day.")
    end
  end

  describe "Failure call", vcr: { cassette_name: "twitter_tweets/failure" } do
    it "raise error" do
      expect{ subject.call }.to raise_error(TwitterTweetsService::Failed, "It was not possible to have a response from TwitterTweetsService")
    end
  end
end
