FactoryBot.define do
  factory :boat do
    name { 'Sample Boat' }
    description { 'A beautiful boat for your next adventure' }
    image { 'boat_image.jpg' }
    finance { 1000 }
    option { 1.5 }
    duration { 2 }
    amount { 200 }
    availability { true }
  end
end
