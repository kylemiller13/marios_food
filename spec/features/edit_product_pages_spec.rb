require 'rails_helper'

describe "edit a product" do
  before(:each) do 
    visit new_product_path
    click_link 'Register'
    fill_in 'user_email', with: 'userEmail@gmail.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    @user = User.last
    @user.update(admin: true)
  end

  it "edits a product" do
    product = Product.create(:name => 'Apple', :cost => '70.00', :country_of_origin => 'USA')
    visit edit_product_path(product)
    fill_in 'Name', :with => 'Pear'
    click_on 'Update Product'
    expect(page).to have_content 'Pear'
  end

  it "gives an error when no description is entered" do
    product = Product.create(:name => 'Apple', :cost => '70.00', :country_of_origin => 'USA')
    visit edit_product_path(product)
    fill_in 'Name', :with => ''
    click_button 'Update Product'
    expect(page).to have_content 'errors'
  end

  it "deletes a product" do
    product = Product.create(:name => 'Apple', :cost => '70.00', :country_of_origin => 'USA')
    visit product_path(product)
    click_button 'Delete Product'
    expect(page).not_to have_content 'Pear'
  end
end