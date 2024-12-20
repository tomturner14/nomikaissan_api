class Participant < ApplicationRecord
  belongs_to :event
  has_many :attendances, dependent: :destroy

  validates :name, presence: true
end
