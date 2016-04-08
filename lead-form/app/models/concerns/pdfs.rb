# encoding: utf-8
# frozen_string_literal: true
require 'prawn'

module Pdfs
  def self.generate_pdf(lead)
    pdf = Prawn::Document.new
    format_document(lead, pdf)
    pdf.encrypt_document(user_password: ENV['PASSWORD'],
                         owner_password: :random,
                         permissions: { print_document: true,
                                        modify_contents: false,
                                        copy_contents: false,
                                        modify_annotations: false })
    pdf_path = "#{Rails.root}/tmp/generated_#{Time.now}.pdf"
    pdf.render_file(pdf_path)
  rescue # TODO: Build tests to sort out some sort of error to rescue from
    flash[:error] = 'An error occurred while attempting to render pdf.'
    redirect_to :back && return
  end

  def self.format_document(lead, pdf)
    # In the real world, I'd take the key,value pairs of attributes and move
    # through each to DRY this up and make it not-lead-specific (i.e. actually
    # reusable), but I have a plane to catch. :-/
    pdf.text "Title: #{lead.title}"
    pdf.text "First Name: #{lead.first_name}"
    pdf.text "Last Name: #{lead.last_name}"
    pdf.text "Email: #{lead.email}"
    pdf.text "Phone Number: #{lead.phone_number}"
    pdf.text "Down Payment: #{lead.down_payment}"
    pdf.text "Loan Amount: #{lead.loan_amount}"
    pdf.text "Interest Rate: #{lead.interest_rate}"
  end

  def self.upload_to_s3_bucket
    { bucket: ENV['S3_BUCKET_NAME'], access_key_id: ENV['AWS_KEY'],
      secret_access_key: ENV['AWS_SECRET'] }
  end
end
