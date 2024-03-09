FactoryBot.define do
  factory :reservation do
    date { Date.today }
    city { 'Sample City' }
    user
    boat
  end
end
