require 'rails_helper'

RSpec.describe Boat, type: :model do
  subject do
    Boat.new(
      name: 'my first boat',
      description: 'this is the first description text of my first description boat',
      image: 'image.png',
      option: 0,
      amount: 0,
      duration: 0,
      finance: 0.0,
      availability: true
    )
  end

  before { subject.save }

  it 'Name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'description should be present' do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it 'image link should be present' do
    subject.image = nil
    expect(subject).to_not be_valid
  end

  it 'option should be greater or equal to zero' do
    subject.option = -3
    expect(subject).to_not be_valid
  end

  it 'amount should be greater or equal to zero' do
    subject.amount = -3
    expect(subject).to_not be_valid
  end

  it 'duration should be greater or equal to zero' do
    subject.duration = -3
    expect(subject).to_not be_valid
  end

  it 'duration should be an integer' do
    subject.duration = 3.2
    expect(subject).to_not be_valid
  end

  it 'availability should be boolean' do
    subject.availability = true
    expect(subject).to be_valid
  end
end
