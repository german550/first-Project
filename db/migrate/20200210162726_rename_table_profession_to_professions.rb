class RenameTableProfessionToProfessions < ActiveRecord::Migration[6.0]
  def change
    rename_table :profession, :professions
  end
end
