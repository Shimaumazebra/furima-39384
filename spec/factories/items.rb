FactoryBot.define do
  factory :item do
    name                  { 'Elephant' }
    description           { '象さん' }
    category_id           { '2' }
    condition_id          { '2' }
    prefecture_id         { '2' }
    price                 { '900' }
    estimated_shipping_id { '2' }
    postage_fee_id        { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/test-image/test_elephant.png'), filename: 'test_elephant.png')
    end
  end
end