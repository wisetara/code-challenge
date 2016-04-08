# encoding: utf-8
# frozen_string_literal: true

require 'rails_helper'

describe 'Guest may create lead' do
  it 'allows a guest to create a lead' do
    visit '/'
    within '.personal-details' do
      select 'Ms.', from: 'Title'
      fill_in 'First name', with: 'Random'
      fill_in 'Last name', with: 'Person'
      fill_in 'Phone number', with: '1-234-56789'
      fill_in 'Email', with: 'some_email@example.com'
    end

    within '.loan-details' do
      fill_in 'Interest rate', with: 1.25
      fill_in 'Loan amount', with: 100_000
      fill_in 'Down payment', with: 20_000
    end

    expect do
      click_link_or_button 'Start Loan Application'
    end.to change { Lead.count }.by(1)

    expect(page).to have_content('Thank you!')
  end
end
