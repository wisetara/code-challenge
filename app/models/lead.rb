# encoding: utf-8
# frozen_string_literal: true
require 'aes'

class Lead < ActiveRecord::Base
  validates :first_name, :last_name, :email, :phone_number, presence: true

  attr_encrypted :title, key: :encryption_key, iv: ENV['AWS_SECRET_ENCRYPTION_KEY']
  attr_encrypted :first_name, key: :encryption_key, iv: ENV['AWS_SECRET_ENCRYPTION_KEY']
  attr_encrypted :last_name, key: :encryption_key, iv: ENV['AWS_SECRET_ENCRYPTION_KEY']
  attr_encrypted :email, key: :encryption_key, iv: ENV['AWS_SECRET_ENCRYPTION_KEY']
  attr_encrypted :phone_number, key: :encryption_key, ENV['AWS_SECRET_ENCRYPTION_KEY']

  after_save :generate_pdf

  def encryption_key
    @key ||= AES.key
  end

  def generate_pdf
    Pdfs.generate_pdf(self)
    Pdfs.upload_to_s3_bucket
  end

  def down_payment=(down_payment)
    self[:down_payment] = parse_number(down_payment)
  end

  def interest_rate=(interest_rate)
    self[:interest_rate] = parse_number(interest_rate)
  end

  def loan_amount=(loan_amount)
    self[:loan_amount] = parse_number(loan_amount)
  end

  def parse_number(attribute)
    attribute.delete!(',', '') if attribute.is_a?(String) unless attribute.blank?
    attribute.to_i
  end
end
