class Attendance < ApplicationRecord
  belongs_to :participant
  belongs_to :event_date

  validates :status, presence: true
  validates :event_date_id, presence: true
end
