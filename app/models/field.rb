class Field < ApplicationRecord
  belongs_to :user
  has_many :hours, dependent: :destroy
  has_many :periods, through: :hours
  has_many :reservations, through: :periods
end
