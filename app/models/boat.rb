class Boat < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, :description, :image, presence: true
  validates :finance, :option, :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :availability, inclusion: { in: [true, false] }
end
