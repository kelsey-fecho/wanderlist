class Trip < ActiveRecord::Base
  belongs_to :user
  has_many :trip_destinations
  has_many :destinations, through: :trip_destinations
end
