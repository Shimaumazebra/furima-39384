FactoryBot.define do
  factory :order_address do
    token              {'sk_test_89bab59f6a5a1e0a15756658'}
    post_code          { '123-4567' }
    prefecture_id      { '2' }
    city               { '大阪市' }
    address            { '中央区1-11' }
    building_name      { '2' }
    phone_num          { '0120117117' }
    item_id            { '1'}
    user_id            { '1'}
  end
end
