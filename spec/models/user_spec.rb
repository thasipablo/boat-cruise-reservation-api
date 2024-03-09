require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(
      name: 'John Doe'
    )
  end

  before { subject.save }

  it 'validates that name is present and unique' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'has many reservations' do
    first_reservation = subject.reservations.create(city: 'Sample City')
    second_reservation = subject.reservations.create(city: 'Another City')
    expect(subject.reservations).to include(second_reservation)
    expect(subject.reservations).to include(first_reservation)
  end
end
