class CreateProfessionUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :profession_users do |t|
      t.integer :user_id
      t.integer :profession_id

      t.timestamps
    end
  end
end
