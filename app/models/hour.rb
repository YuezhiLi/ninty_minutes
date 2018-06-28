class Hour < ApplicationRecord
  belongs_to :field
  has_one :period, dependent: :destroy
  has_one :reservation, through: :period
end
