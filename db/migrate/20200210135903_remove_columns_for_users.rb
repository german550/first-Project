class RemoveColumnsForUsers < ActiveRecord::Migration[6.0]
  def change
      remove_column :users, :profession, :string
      remove_column :users, :post_id, :string
  end
end
