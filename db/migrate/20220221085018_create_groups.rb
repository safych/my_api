class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name, null: false, unique: true
      t.string :country, null: false

      t.timestamps
    end
  end
end
