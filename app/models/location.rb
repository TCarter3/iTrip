class Location < ApplicationRecord
  belongs_to :Trip

  has_one :address, dependent: :destroy
end
