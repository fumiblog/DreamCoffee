class Address < ApplicationRecord
  belongs_to :user

  def full_address
    name + postal_code + address + telephone
  end

end
