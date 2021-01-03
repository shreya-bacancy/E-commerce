# frozen_string_literal: true

json.extract! address, :id, :user_id, :state, :pincode, :city, :address, :area, :created_at, :updated_at
json.url address_url(address, format: :json)
