class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profession, :string
    add_column :users, :country, :string
    add_column :users, :city, :string
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :post_id, :integer
    add_column :users, :admin, :boolean
    add_column :users, :contractor, :boolean
  end
end
