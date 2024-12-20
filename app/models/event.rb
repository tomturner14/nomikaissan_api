class Event < ApplicationRecord
  has_many :event_dates, dependent: :destroy
  has_many :participants, dependent: :destroy

  accepts_nested_attributes_for :event_dates

  validates :name, presence: true
  validates :url_id, presence: true, uniqueness: true
end
