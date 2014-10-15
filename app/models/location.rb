class Location < ActiveRecord::Base
  has_many :units
  accepts_nested_attributes_for :units
end
