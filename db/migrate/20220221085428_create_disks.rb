class CreateDisks < ActiveRecord::Migration[6.1]
  def change
    create_table :disks do |t|
      t.string :name,  null: false
      t.integer :number_of_songs, null: false

      t.timestamps
    end
  end
end
