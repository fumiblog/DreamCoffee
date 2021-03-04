class OrderDetail < ApplicationRecord
  belongs_to :item
  enum making_status: {
    seisakufuka: 0,
    seisakumachi: 1,
    seisakuchu: 2,
    seisakukanryou: 3
  }
end
