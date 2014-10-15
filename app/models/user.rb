class User < ActiveRecord::Base
  has_many :programs
  has_many :units, through: :programs
  has_many :transmits
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  def role?(role)
    roles.include? role.to_s
  end
  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
