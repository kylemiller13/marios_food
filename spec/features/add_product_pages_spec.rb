require 'rails_helper'

describe "creates a product" do
  it "adds a new product" do
    visit products_path
    click_link 'Create New Product'
    fill_in 'Name', :with => 'Apple'
    fill_in 'Cost', :with => '50.00'
    fill_in 'product_country_of_origin', :with => 'USA'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives an error when the form is not filled out" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'errors'
  end
end