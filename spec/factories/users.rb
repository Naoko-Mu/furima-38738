FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             { '村石' }
    first_name            { '尚子' }
    last_name_kana        { 'ムライシ' }
    first_name_kana       { 'ナオコ' }
    birthday        { '1986-07-15' }
  end
end
