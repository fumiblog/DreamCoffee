class Taste < ApplicationRecord
  has_many :items, dependent: :destroy
end
