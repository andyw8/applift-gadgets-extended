require 'spec_helper'

describe GadgetsController do
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end

    it "returns only gadgets belonging to the logged in user" do
      me = user # same object as other specs, just renamed for clarity
      my_friend = FactoryGirl.create(:user, email: 'friend@example.com')
      my_gadget = FactoryGirl.create(:gadget, name: 'Samsung S3', owner: me)
      my_friends_gadget = FactoryGirl.create(:gadget, name: 'Nintendo Wii', owner: my_friend)
      get :index
      expect(assigns(:gadgets)).to eq [my_gadget]
    end
  end

  describe "GET 'new'" do
    it "assigns a new gadget" do
      get :new
      expect(assigns(:gadget)).to be_a_new(Gadget)
    end
  end

  describe "POST 'create'" do
    let(:valid_attrs) { FactoryGirl.attributes_for(:gadget) }

    it "assigns a new gadget, perists it, and redirects" do
      post :create, { gadget: valid_attrs }
      expect(assigns(:gadget)).to be_a(Gadget)
      expect(assigns(:gadget)).to be_persisted
      expect(response).to redirect_to gadgets_path
    end

    context "with missing required information" do
      it "assigns a new gadgets, doesn't persist it, re-renders the :new template" do
        valid_attrs['name'] = ''
        post :create, { gadget: valid_attrs }
        expect(assigns(:gadget)).to be_a(Gadget)
        expect(assigns(:gadget)).to_not be_persisted
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET 'edit'" do
    let(:gadget) { FactoryGirl.create(:gadget, owner: user) } # TODO use build_stubbed here?

    it "assigns the gadget" do
      get :edit, id: gadget.id
      expect(assigns(:gadget)).to eq(gadget)
    end
  end

  describe "PATCH 'update'" do
    let(:gadget) { FactoryGirl.create(:gadget, owner: user) } # TODO use build_stubbed here?

    it "assigns the gadget and redirects" do
      patch :update, id: gadget.id, gadget: FactoryGirl.attributes_for(:gadget)
      expect(assigns(:gadget)).to eq(gadget)
      expect(response).to redirect_to gadgets_path
    end
  end

  describe "DELETE 'destroy'" do
    let(:gadget) { FactoryGirl.create(:gadget, owner: user) }

    it "deletes the gadget and redirects" do
      delete :destroy, id: gadget.id
      expect(response).to redirect_to gadgets_path
      expect(Gadget.count).to eq(0)
    end
  end
end
