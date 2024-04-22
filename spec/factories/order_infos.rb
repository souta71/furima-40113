FactoryBot.define do
  factory :order_info do
    postal_code  { '123-4567' }
    area_id      { 2 }
    city         { '横浜市緑区' }
    address      { '青山1-1-1' }
    building     { '柳ビル103' }
    phone_number { '0901234567' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
