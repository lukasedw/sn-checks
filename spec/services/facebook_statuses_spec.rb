require "rails_helper"

RSpec.describe FacebookStatusesService do
  describe "Success call", vcr: { cassette_name: "facebook_statuses/success" } do
    it "returns the username" do
      expect(subject.call[0]["name"]).to eq("Some Friend")
    end
    it "returns the tweet" do
      expect(subject.call[0]["status"]).to eq("Here's some photos of my holiday. Look how much more fun I'm having than you are!")
    end
  end

  describe "Failure call", vcr: { cassette_name: "facebook_statuses/failure" } do
    it "raise error" do
      expect{ subject.call }.to raise_error(FacebookStatusesService::Failed, "It was not possible to have a response from FacebookStatusesService")
    end
  end
end
