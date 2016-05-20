class CreateAdherents < ActiveRecord::Migration
  def change
    create_table :adherents do |t|
      t.string :nom
      t.string :prenom
      t.string :CIN

      t.timestamps null: false
    end
  end
end
