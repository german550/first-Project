class CreateDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :descriptions do |t|
      t.string :description
      t.integer :user_id
      t.integer :profession_id

      t.timestamps
    end
  end
end
