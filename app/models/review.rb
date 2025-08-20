class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rating, presence: true
  validates :comment, presence: true
  validates :user_id, uniqueness: { scope: :product_id, message: "has already reviewed this product" }

end
