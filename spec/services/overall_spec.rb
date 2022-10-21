require "rails_helper"

RSpec.describe OverallService do
  let(:subject_instance) { subject.call }
  let(:twitter) { subject_instance[:twitter] }
  let(:facebook) { subject_instance[:facebook] }
  let(:errors) { subject_instance[:errors] }

  describe "Success call overall", vcr: { cassette_name: "overall/success" } do
    it "returns twitter" do
      expect(twitter).not_to be_empty
    end

    it "returns facebook" do
      expect(facebook).not_to be_empty
    end
  end

  describe "Failure call twitter", vcr: { cassette_name: "overall/failure" } do
    it "returns twitter nil" do
      expect(twitter).to be_nil
    end

    it "returns errors" do
      expect(errors).to include("It was not possible to have a response from TwitterTweetsService")
    end
  end

  describe "Failure response facebook", vcr: { cassette_name: "overall/failure" } do
    it "returns facebook nil" do
      expect(facebook).to be_nil
    end

    it "returns errors" do
      expect(errors).to include("It was not possible to have a response from FacebookStatusesService")
    end
  end
end
