# frozen_string_literal: true

class Supplier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :products
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
