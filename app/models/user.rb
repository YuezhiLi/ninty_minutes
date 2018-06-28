class User < ApplicationRecord
  has_many :fields, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reservations, through: :bookings
end
