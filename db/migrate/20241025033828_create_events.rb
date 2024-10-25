class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :memo
      t.string :url_id

      t.timestamps
    end

    add_index :events, :url_id, unique: true
  end
end
