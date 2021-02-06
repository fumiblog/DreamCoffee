class AddColumnOrders < ActiveRecord::Migration[6.1]
  def up
    add_column :orders, :payment_method, :integer
  end
end
