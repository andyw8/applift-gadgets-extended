require 'spec_helper'

describe "Gadgets" do
  describe "GET /gadgets" do
    it "renders sucessfully" do
      get gadgets_path
      response.status.should be(200)
    end
  end
end
