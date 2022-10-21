require "rails_helper"

RSpec.describe OverallService do
  let(:subject_instance) { subject.call }
  let(:twitter) { subject_instance[:twitter] }
  let(:errors) { subject_instance[:errors] }

  describe "Success call", vcr: { cassette_name: "overall/success" } do
    it "returns twitters" do
      expect(twitter).not_to be_empty
    end
  end

  describe "Failure call", vcr: { cassette_name: "overall/failure" } do
    it "returns twitter nil" do
      expect(twitter).to be_nil
    end

    it "returns errors" do
      expect(errors[0]).to eq("It was not possible to have a response from TwitterTweetsService")
    end
  end
end
