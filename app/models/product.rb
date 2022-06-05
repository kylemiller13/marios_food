class Product < ApplicationRecord
  has_many :reviews

  validates :name, :presence => true
  validates :cost, :presence => true
  validates :country_of_origin, :presence => true


  scope :most_reviews, -> {(
    select("products.id, products.name, products.cost, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(7)
  )}

  scope :ten_most_recent, -> {order(created_at: :desc).limit(10)}

  scope :from_usa, -> {where(country_of_origin: "USA")}

  before_save(:titleize_product)

  private
  def titleize_product
    self.name = self.name.titleize
  end
end