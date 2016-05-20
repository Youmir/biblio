class CreateLivres < ActiveRecord::Migration
  def change
    create_table :livres do |t|
      t.integer :isbn
      t.string :titre
      t.string :auteur
      t.integer :estDispo
      t.integer :estValide

      t.timestamps null: false
    end
  end
end
