# encoding: utf-8
# frozen_string_literal: true

require 'lead'

RSpec.describe Lead, type: :model do
  subject(:lead) { Lead.new id: '123' }

  describe 'a lead without required attributes' do
    subject { Lead.new }
    it { should_not be_persisted }
  end

  describe 'a lead with required attributes' do
    subject { FactoryGirl.create(:lead) }
    it { should be_persisted }
  end

  it 'ensures encryption is present' do
    lead = FactoryGirl.create(:lead)
    contact_params = [:title, :first_name, :last_name, :email, :phone_number]
    contact_params.each do |param|
      expect(Lead.last.send("encrypted_#{param}")).to eq(lead.send("encrypted_#{param}"))
      expect(lead.title).not_to eq(lead.encrypted_title)
    end
  end
end
