require 'rails_helper'

describe "add a product to the page" do
  before :each do
    visit new_product_path
    product = Product.create({name: "Meat Pie", cost: 3, country_of_origin: 'USA'})
    click_on "Create Product"
  end

  it "adds a new review" do
    visit products_path
    click_on "Meat Pie", match: :first
    click_on 'Add a review'
    fill_in 'Author', :with => 'Greg'
    fill_in 'Content body', :with => 'This product is great!'
    fill_in 'Rating', :with => 5
    click_on 'Create Review'
    expect(page).to have_content 'Review successfully added!'
    expect(page).to have_content 'Greg'
  end

  it "gives an error when no author is entered" do
    visit products_path
    click_on "Meat Pie", match: :first
    click_on 'Add a review'
    click_on 'Create Review'
    expect(page).to have_content "Author can't be blank"
  end

end