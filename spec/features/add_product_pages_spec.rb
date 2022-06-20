require 'rails_helper'

describe "the add a product process" do
  before(:each) do
    visit new_user_registration_path
    fill_in 'Email', with: 'fakename@fake.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    User.find_by(email: "fakename@fake.com").update!(admin: true)
  end
  
  it "adds a new product" do
    visit products_path
    click_link 'Create new product'
    fill_in 'Name', :with => 'Goat Cheese'
    fill_in 'Cost', :with => 5
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Submit'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Goat Cheese'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Submit'
    expect(page).to have_content "Name can't be blank"
  end

end

