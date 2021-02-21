class AddColumnItems < ActiveRecord::Migration[6.1]
  def up
    add_column :items, :roast_id, :integer
    add_column :items, :taste_id, :integer
  end
end
