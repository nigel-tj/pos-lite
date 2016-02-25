FactoryGirl.define do
  factory :account do
    email { Faker::Internet.email }
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.zone.today
  end

  factory :user do
    email { Faker::Internet.email }
    encrypted_password '$2a$10$BcgADiGLA5jzdj43nGdxo.nWREBlzjFDloaUXeB199QZJt1LFTlvG'
    password 'password'
    password_confirmation 'password'
  end
end
