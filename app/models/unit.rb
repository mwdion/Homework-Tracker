class Unit < ActiveRecord::Base
  belongs_to :location
  has_many :programs
  has_many :users, through: :programs
  has_many :projects
end
