class CreateApps < ActiveRecord::Migration[6.1]
  def change
    create_table :apps do |t|
      t.string :name
      t.string :url
      t.string :repo
      t.string :status

      t.timestamps
    end
  end
end
