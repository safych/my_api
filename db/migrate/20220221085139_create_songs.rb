class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :name, null: false
      t.string :text, null: false
      t.belongs_to :group, foreign_key: { to_table: :groups, on_delete: :cascade }
      t.belongs_to :disk, foreign_key: { to_table: :disks, on_delete: :cascade }

      t.timestamps
    end
  end
end
