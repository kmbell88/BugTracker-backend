class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.integer :zipCode
      t.string :password_digest

      t.timestamps
    end
  end
end
