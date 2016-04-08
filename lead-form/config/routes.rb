# encoding: utf-8
# frozen_string_literal: true

Rails.application.routes.draw do
  root 'leads#new'
  resources :leads, only: [:new, :create]
end
