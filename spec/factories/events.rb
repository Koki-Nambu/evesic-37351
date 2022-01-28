FactoryBot.define do
  factory :event do
    title { "イベント名" }
    date {2022-03-10}
    place { "イベント会場" }
    charge {2000}
    content {"イベント内容が記載されます"}
    association :user, factory: :user
    after(:build) do |event|
      event.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
