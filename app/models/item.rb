class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :roast
  belongs_to :taste
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  attachment :image
  validates :name, presence: true
  validates :genre_id, presence: true
  validates :intoroduction, presence: true
  validates :price, presence: true
  validates :roast_id, presence: true
  validates :taste_id, presence: true
end
