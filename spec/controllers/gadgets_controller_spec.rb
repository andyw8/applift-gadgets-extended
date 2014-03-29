require 'spec_helper'

describe GadgetsController do
  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "assigns a new gadget" do
      get :new
      expect(assigns(:gadget)).to be_a_new(Gadget)
    end
  end

  describe "POST 'create'" do
    it "assigns a new gadget" do
      valid_attrs = FactoryGirl.attributes_for(:gadget)
      post :create, { gadget: valid_attrs }
      expect(assigns(:gadget)).to be_a(Gadget)
      expect(assigns(:gadget)).to be_persisted
      expect(response).to redirect_to gadgets_path
    end
  end
end
