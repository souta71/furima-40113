FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { 'test@example' }
    password              { '000000' }
    password_confirmation { password }
    first_name            { 'あ' }
    last_name             { 'あ' }
    first_name_kana       { 'ア' }
    last_name_kana        { 'ア' }
    birth                 { Date.new(1930, 1, 1) }
  end
end
