require 'rails_helper'

RSpec.describe "Languages", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/languages/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/languages/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/languages/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
