class AddPasswordDigestToAdherents < ActiveRecord::Migration
  def change
    add_column :adherents, :password_digest, :string
  end
end
