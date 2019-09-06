class Location < ApplicationRecord
  belongs_to :Trip

  has_many :addresses
end
