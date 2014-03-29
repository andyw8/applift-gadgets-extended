require 'spec_helper'

feature 'Managing Gadgets' do
  scenario "A user with no gadgets" do
    visit gadgets_path
    expect(page).to have_content "You have no gadgets"
  end
end

