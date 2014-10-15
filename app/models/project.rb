class Project < ActiveRecord::Base
  belongs_to :unit
  has_many :transmits
  has_many :comments, as: :commentable
end
