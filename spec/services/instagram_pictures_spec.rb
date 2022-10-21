require "rails_helper"

RSpec.describe InstagramPicturesService do
  describe "Success call", vcr: { cassette_name: "instagram_pictures/success" } do
    it "returns the username" do
      expect(subject.call[0]["username"]).to eq("hipster1")
    end
    it "returns the tweet" do
      expect(subject.call[0]["picture"]).to eq("food")
    end
  end

  describe "Failure call", vcr: { cassette_name: "instagram_pictures/failure" } do
    it "raise error" do
      expect{ subject.call }.to raise_error(InstagramPicturesService::Failed, "It was not possible to have a response from InstagramPicturesService")
    end
  end
end
