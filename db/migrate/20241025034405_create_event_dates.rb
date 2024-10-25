class CreateEventDates < ActiveRecord::Migration[7.1]
  def change
    create_table :event_dates do |t|
      t.datetime :date

      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
