class Reservation < ApplicationRecord
  belongs_to :boat
  belongs_to :user
end
