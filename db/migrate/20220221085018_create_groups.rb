class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string     :name, null: false
      t.belongs_to :singers, array: true, default: [], index: true, foreign_key: true
      t.string     :country, null: false
      t.belongs_to :songs, array: true, default: [], index: true, foreign_key: true

      t.timestamps
    end
  end
end
