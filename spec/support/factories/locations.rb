FactoryGirl.define do
  factory :location do
    name            { Faker::Name.name }
    url             { Faker::Internet.url }
    street          { Faker::Address.street_name }
    house_number    { Faker::Address.street_suffix }
    city            { Faker::Address.city }
    zip             { Faker::Address.zip_code }
    lat             { "53.#{Faker::Address.zip_code}".to_i }
    long            { "9.#{Faker::Address.zip_code}".to_i }
  end
end
