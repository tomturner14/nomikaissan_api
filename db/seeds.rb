# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
event1 = Event.create(name: "飲み会", memo: "新年会", url_id: "nomikaisan-unique-1")

participant1 = Participant.create(event_id: event1.id, name: "田中")

event_date1 = EventDate.create(event_id: event1.id, date: DateTime.new(2024, 01, 05, 19, 0))

Attendance.create(event_date_id: event_date1.id, participant_id: participant1.id, status: 1, comment: "出席予定")
