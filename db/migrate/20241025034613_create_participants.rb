class CreateParticipants < ActiveRecord::Migration[7.1]
  def change
    create_table :participants do |t|
      t.integer :event_id
      t.string :name

      t.timestamps
    end
  end
end
