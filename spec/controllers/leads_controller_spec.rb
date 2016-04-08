# frozen_string_literal: true
require 'rails_helper'

describe LeadsController do
  describe '#create' do
    let(:lead) { Lead.new id: '123' }

    before do
      @lead = {
        title: 'Ms.',
        first_name: 'Tara',
        last_name: 'Scherner de la Fuente',
        phone_number: '503-555-1212',
        email: 'taralikesgoats@gmail.com',
        interest_rate: 5,
        loan_amount: 300_000,
        down_payment: 60_000
      }
    end

    it 'saves a lead' do
      post :create, lead: @lead
      expect(assigns(:lead)).to have_same_attributes_as(Lead.last)
      expect(response).to be_success
    end
  end
end
