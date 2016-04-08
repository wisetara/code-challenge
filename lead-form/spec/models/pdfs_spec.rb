# encoding: utf-8
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pdfs, type: :module do
  describe 'pdf security' do
    factory_lead = FactoryGirl.create(:lead)
    let(:lead) { Pdfs.generate_pdf(factory_lead) }

    it 'requires a password' do
      expect { PDF::Inspector::Text.analyze("#{Rails.root}/tmp/generated_#{Time.now}.pdf") }
        .to raise_error
    end

    it 'returns encrypted pdf' do
      expect(Pdfs.generate_pdf(factory_lead).inspect).not_to include('tara')
    end
  end
end
