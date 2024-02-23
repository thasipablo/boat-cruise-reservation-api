class Boat < ApplicationRecord
	has_many :reservations

	validates :name, :description, :image, presence: true
	validates :finance_fee, :option_to_purchase_fee, :amount_payable, numericality: { greater_than_or_equal_to: 0 }
	validates :duration, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
	validates :availability, inclusion: { in: [true, false] }
end
