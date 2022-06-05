require 'rails_helper'

describe "add a review" do
  it "adds a new review" do
    product = Product.create(:name => 'Apple', :cost => '70.00', :country_of_origin => 'USA')
    visit product_path(product)
    click_link 'Write a Review'
    fill_in 'Author', :with => 'Kyle'
    fill_in 'Content body', :with => 'This fruit is WONDERFUL but could use a little more flavor'
    fill_in 'Rating', :with => 4
    click_on 'Create Review'
    expect(page).to have_content 'Kyle'
  end

  it "gives error when form is not filled out" do
    product = Product.create(:name => 'Apple', :cost => '70.00', :country_of_origin => 'USA')
    visit new_product_review_path(product)
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end

  it "gives error when rating is out of range" do
    product = Product.create(:name => 'Apple', :cost => '70.00', :country_of_origin => 'USA')
    visit new_product_review_path(product)
    fill_in 'Author', :with => 'Kyle'
    fill_in 'Content body', :with => 'This fruit is WONDERFUL but could use a little more flavor'
    fill_in 'Rating', :with => 7
    click_on 'Create Review'
    expect(page).to have_content 'errors'
  end
end