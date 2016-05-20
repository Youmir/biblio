class CreateLivresEmpruntes < ActiveRecord::Migration
  def change
    create_table :livres_empruntes do |t|
      t.integer :livre_id
      t.integer :adherent_id

      t.timestamps null: false
    end
  end
end
