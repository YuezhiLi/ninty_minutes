class Reservation < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :users, through: :bookings
  has_many :periods, dependent: :destroy
  has_many :hours, through: :periods
end
