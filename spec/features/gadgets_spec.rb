require 'spec_helper'

feature 'Managing Gadgets' do
  let(:user) { FactoryGirl.create(:user) }

  before do
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'hello123'
    click_button 'Sign in'
  end

  scenario "A user with no gadgets" do
    visit gadgets_path
    expect(page).to have_content "You have 0 gadgets"
  end

  scenario "A user with some gadgets" do
    2.times { FactoryGirl.create(:gadget, owner: user) }
    visit gadgets_path
    expect(page).to have_content "You have 2 gadgets"
    expect(page).to have_css('.gadgets li', count: 2)
  end

  scenario "Adding a new gadget" do
    visit gadgets_path
    click_link 'Add Gadget'
    fill_in 'Name', with: "iPhone"
    click_button 'Create Gadget'
    expect(current_path).to eq(gadgets_path)
    expect(page).to have_content "New gadget added"
  end

  scenario "Adding a new gadget but missing required information" do
    # TODO this could be tested here, but testing it at the controller level
    # should be sufficient, since we have already covered the happy path above
  end

  scenario "Editing a gadget" do
    FactoryGirl.create(:gadget, name: 'iPad', owner: user)
    visit gadgets_path
    click_link 'iPad'
    fill_in 'Name', with: 'iPad Air'
    click_button 'Update Gadget'
    expect(current_path).to eq(gadgets_path)
    expect(page).to have_content "Gadget updated"
    expect(page).to have_content "iPad Air"
  end

  scenario "Editing an existing gadget but missing required information" do
    # TODO this could be tested here, but testing it at the controller level
    # should be sufficient, since we have already covered the happy path above
  end

  scenario "Deleting a gadget" do
    FactoryGirl.create(:gadget, name: 'iPad', owner: user)
    visit gadgets_path
    click_link 'iPad'
    click_button 'Delete Gadget'
    expect(current_path).to eq(gadgets_path)
    expect(page).to have_content "Gadget deleted"
    expect(page).to have_no_content "iPad Air"
  end
end
