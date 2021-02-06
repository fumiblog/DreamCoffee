class Order < ApplicationRecord
  belongs_to :user
  enum status: {
      nyukinmachi: 0,
      nyukinkakunin: 1,
      seisakuchu: 2,
      hassouzumi: 3
  }
  enum payment_method: {
    credit: 0,
    bank: 1,
    counter: 2
  }
end
