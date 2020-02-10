class AddUserIdColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :professions, :user_id, :integer
  end
end
