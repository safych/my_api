class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :number
      t.belongs_to :song, foreign_key: { to_table: :songs, on_delete: :cascade }

      t.timestamps
    end
  end
end
