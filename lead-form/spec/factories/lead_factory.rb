# frozen_string_literal: true

FactoryGirl.define do
  factory :lead do
    title 'Ms.'
    first_name 'Tara'
    last_name 'Scherner de la Fuente'
    phone_number '503-555-1212'
    email 'taralikesgoats@gmail.com'
    interest_rate 5
    loan_amount 300_000
    down_payment 60_000
  end
end
