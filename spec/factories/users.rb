FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    artist_name { Faker::Name.name }
    email {Faker::Internet.free_email }
    password = '12345k'
    password { password }
    password_confirmation { password }
    profile {"プロフィールです"}
    url {"http.urlurl"}
    genre_id {2}
    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end