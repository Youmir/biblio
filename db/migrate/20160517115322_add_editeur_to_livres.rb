class AddEditeurToLivres < ActiveRecord::Migration
  def change
    add_column :livres, :editeur, :string
  end
end
