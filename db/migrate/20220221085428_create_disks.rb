class CreateDisks < ActiveRecord::Migration[6.1]
  def change
    create_table :disks do |t|
      t.string     :name, null: false
      t.belongs_to :songs, array: true, default: [], index: true, foreign_key: true

      t.timestamps
    end
  end
end
