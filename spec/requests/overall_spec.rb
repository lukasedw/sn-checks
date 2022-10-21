require "rails_helper"

RSpec.describe "Overalls", type: :request do
  describe "GET /index" do
    it "returns http success over social network request success", vcr: { cassette_name: "overall/success" } do
      get "/"
      expect(response).to have_http_status(:success)
    end

    it "returns http success over social network request failure", vcr: { cassette_name: "overall/failure" } do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end
end
