FactoryBot.define do
  factory :user do
    name                  { 'テストアカウント' }
    email                 { 'test@test.co.jp' }
    password              { 'tesutesu123' }
    password_confirmation { 'tesutesu123' }
    last_name             { '鈴木' }
    first_name            { '雅之' }
    last_name_kana        { 'スズキ' }
    first_name_kana       { 'マサユキ' }
    date_of_birth         { '1959-03-09' }
  end
end
