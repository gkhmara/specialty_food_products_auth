require 'rails_helper'

describe "edits a product on the page" do
  before :each do
    Product.destroy_all
  end
  
  it "updates a new product" do
    product = Product.create({name: "Meat Pie", cost: 3, country_of_origin: 'USA'})
    product.save
    visit products_path
    click_on 'Meat Pie', match: :first
    click_on 'Edit'
    fill_in 'Name', :with => 'Old Sock'
    fill_in 'Cost', :with => '5'
    fill_in 'Country of origin', :with => 'USA'
    click_on 'Update Product'
    expect(page).to have_content 'Product successfully updated!'
    expect(page).to have_content 'Old Sock'
  end

  it "deletes a product" do
    product = Product.create({name: "Meat Pie", cost: 3, country_of_origin: 'USA'})
    product.save
    visit products_path
    click_on 'Meat Pie', match: :first
    click_on 'Delete'
    expect(page).to have_no_content 'Meat Pie'
  end

  it "shows an error when not entered incorrectly" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content "Name can't be blank"
  end

end