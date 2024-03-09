require 'rails_helper'

RSpec.describe Reservation, type: :model do
  subject do
    Reservation.new(
      date: Date.today,
      city: 'Sample City'
    )
  end

  before { subject.save }

  it 'validates that date is present' do
    subject.date = nil
    expect(subject).to_not be_valid
  end

  it 'validates that city is present' do
    subject.city = nil
    expect(subject).to_not be_valid
  end
end
