class AddEmailToAdherents < ActiveRecord::Migration
  def change
    add_column :adherents, :email, :string
  end
end
