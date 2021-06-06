FactoryBot.define do
  factory :episode do
    title { "episode 1" }
    number {1} 
    association :season
  end
end
