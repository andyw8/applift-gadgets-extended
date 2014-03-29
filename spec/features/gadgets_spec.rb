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
    expect(page).to have_css('.gadgets li', count: 2)
  end

  scenario "Adding a new gadget" do
    visit new_gadget_path
    fill_in 'Name', with: "iPhone"
    click_button 'Create Gadget'
    expect(current_path).to eq(gadgets_path)
    expect(page).to have_content "New gadget added"
  end

  scenario "Adding a new gadget but missing required information" do
    # TODO this could be tested here, but testing it at the controller level
    # should be sufficient
  end
end

