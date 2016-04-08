# encoding: utf-8
# frozen_string_literal: true
require 'application_helper'

class LeadsController < ApplicationController
  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.create(lead_params)
    render :new unless @lead.persisted?
    @lead.generate_pdf
  end

  def search
    @matches = Lead.where(first_name: search_params[:first_name] || last_name: search_params[:last_name])
  end

  private

  def lead_params
    params.require(:lead).permit(:title, :first_name, :last_name, :email,
                                 :phone_number, :interest_rate, :down_payment,
                                 :loan_amount)
  end

  def search_params
    params.require(:lead).permit(:first_name, :last_name)
  end
end
