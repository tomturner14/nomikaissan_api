class EventDate < ApplicationRecord
  belongs_to :event
  has_many :attendances, dependent: :destroy

  validates :date, presence: true
end
