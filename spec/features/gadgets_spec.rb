require 'spec_helper'

feature 'Managing Gadgets' do
  scenario "A user with no gadgets" do
    visit gadgets_path
    expect(page).to have_content "You have 0 gadgets"
  end

  scenario "A user with some gadgets" do
    2.times { FactoryGirl.create(:gadget) }
    visit gadgets_path
    expect(page).to have_content "You have 2 gadgets"
  end
end

