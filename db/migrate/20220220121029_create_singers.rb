class CreateSingers < ActiveRecord::Migration[6.1]
  def change
    create_table :singers do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.integer :age, null: false
      t.string :status, null: false
      t.string :country, null: false
      t.belongs_to :group, foreign_key: { to_table: :groups, on_delete: :cascade }

      t.timestamps
    end
  end
end
