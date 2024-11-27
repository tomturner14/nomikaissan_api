class CreateAttendances < ActiveRecord::Migration[7.1]
  def change
    create_table :attendances do |t|
      t.integer :status
      t.text :comment

      t.references :event_date, foreign_key: true
      t.references :participant, foreign_key: true
      t.timestamps
    end
  end
end
