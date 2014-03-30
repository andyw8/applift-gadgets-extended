require 'spec_helper'

describe Gadget do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:owner) }
  it { should validate_presence_of(:image) }
  it { should belong_to(:owner).class_name('User') }

  context "scopes" do
    context "match_name" do
      let(:iphone) { FactoryGirl.create(:gadget, name: 'iPhone') }
      let(:samsung) { FactoryGirl.create(:gadget, name: 'Samsung', owner: iphone.owner) }

      it "matches exact matches" do
        matches = Gadget.match_name('iPhone')
        expect(matches).to eq [iphone]
      end

      it "matches at the beginning of the name" do
        matches = Gadget.match_name('iPho')
        expect(matches).to eq [iphone]
      end

      it "matches at the end of the name" do
        matches = Gadget.match_name('Phone')
        expect(matches).to eq [iphone]
      end

      it "matches within the name" do
        matches = Gadget.match_name('hon')
        expect(matches).to eq [iphone]
      end

      it "matches even if the case differs" do
        matches = Gadget.match_name('IPHONE')
        expect(matches).to eq [iphone]
      end

      it "matches everything if the search term is blank" do
        matches = Gadget.match_name('')
        expect(matches).to eq [iphone, samsung]
      end
    end
  end
end
