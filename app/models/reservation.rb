class Reservation < ApplicationRecord
  belongs_to :boat
  belongs_to :user

  validates :date, :city, presence: true
end
