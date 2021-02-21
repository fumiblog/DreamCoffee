class Item < ApplicationRecord
  belongs_to :genre
  belongs_to :roast
  belongs_to :taste
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  attachment :image
end
