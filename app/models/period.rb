class Period < ApplicationRecord
  belongs_to :hour
  belongs_to :reservation
end
