class CreateSingers < ActiveRecord::Migration[6.1]
  def change
    create_table :singers do |t|
      t.string  :name,    null: false
      t.string  :surname, null: false
      t.integer :age,     null: false
      t.string  :status,  null: false
      t.string  :country, null: false

      t.timestamps
    end
  end
end
