class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string     :name,   null: false
      t.string     :text,   null: false
      t.belongs_to :rating, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
