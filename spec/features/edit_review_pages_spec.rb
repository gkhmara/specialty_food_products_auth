require 'rails_helper'

describe "edits a product review" do
  before :each do
    Product.destroy_all
  end

  it "deletes a review" do
    product = Product.create({name: "Meat Pie", cost: 3, country_of_origin: 'USA'})
    review = Review.create({author: "Greg", content_body: "This is Great!", rating: 4, product_id: product.id})
    visit product_review_path(product, review)
    click_on 'Delete review'
    expect(page).to have_no_content 'Greg'
  end

  it "updates a product review" do
    product = Product.create({name: "Meat Pie", cost: 3, country_of_origin: 'USA'})
    review = Review.create({author: "Greg", content_body: "This is Great!", rating: 4, product_id: product.id})
    visit product_review_path(product, review)
    click_on 'Edit review'
    fill_in 'Author', :with => 'Michael'
    fill_in 'Content body', :with => 'I do not like this!'
    fill_in 'Rating', :with => 1
    click_on 'Update Review'
    expect(page).to have_content 'Michael'
  end

  it "shows an error when not entered incorrectly" do
    product = Product.create({name: "Meat Pie", cost: 3, country_of_origin: 'USA'})
    review = Review.create({author: "Greg", content_body: "This is Great!", rating: 4, product_id: product.id})
    visit product_review_path(product, review)
    click_on 'Edit review'
    fill_in 'Author', :with => 'Michael'
    fill_in 'Content body', :with => ''
    fill_in 'Rating', :with => 1
    click_on 'Update Review'
    expect(page).to have_content "Content body can't be blank"
  end

end


