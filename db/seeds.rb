Product.destroy_all
Review.destroy_all
50.times do 
  product = Product.create!(
  name: Faker::Food.unique.ingredient,
  cost: Faker::Number.decimal(l_digits: 2),
  country_of_origin: Faker::Address.country
)
  250.times do
    Review.create!(
    author: Faker::Name.name,
    content_body: Faker::Lorem.paragraph_by_chars(number:50),
    rating: Faker::Number.between(from: 1, to: 5),
    product_id: product.id
    )
  end
  p "Created #{Review.count} reviews"
end
p "Created #{Product.count} products"
