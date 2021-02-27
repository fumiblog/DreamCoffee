class AddToOrders < ActiveRecord::Migration[6.1]
  def up
    add_column :orders, :telephone, :string
  end
end
