FactoryBot.define do
  factory :meditation do
    total_sitting_time { 1 }
    date_time { "2023-07-08 20:12:01" }
    user { nil }
  end
end
