class CreateEditeurs < ActiveRecord::Migration
  def change
    create_table :editeurs do |t|
      t.string :username
      t.string :email
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
