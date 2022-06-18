require 'rails_helper'

describe "edit a review" do
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

  it "edits a review" do
    product = Product.create(:name => 'Apple', :cost => '70.00', :country_of_origin => 'USA')
    review = Review.create(:author => 'Kyle', :content_body => 'Et quia amet. Animi voluptatem perferendis. Eaque.', :rating => '3', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => 'John'
    click_on 'Update Review'
    expect(page).to have_content 'John'
  end

  it "gives error when no author is entered" do
    product = Product.create(:name => 'Apple', :cost => '70.00', :country_of_origin => 'USA')
    review = Review.create(:author => 'Kyle', :content_body => 'Et quia amet. Animi voluptatem perferendis. Eaque.', :rating => '3', :product_id => product.id)
    visit edit_product_review_path(product, review)
    fill_in 'Author', :with => ''
    click_button 'Update Review'
    expect(page).to have_content 'errors'
  end

  it "deletes a review" do
    product = Product.create(:name => 'Apple', :cost => '70.00', :country_of_origin  => 'USA')
    review = Review.create(:author => 'Kyle', :content_body => 'Et quia amet. Animi voluptatem perferendis. Eaque.', :rating => '3', :product_id => product.id)
    visit product_review_path(product, review)
    click_on 'Delete Review'
    expect(page).not_to have_content 'Et quia amet. Animi voluptatem perferendis. Eaque.'
  end
end