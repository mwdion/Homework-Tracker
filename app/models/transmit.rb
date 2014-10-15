class Transmit < ActiveRecord::Base
  belongs_to :projects
  belongs_to :users
  has_many :comments, as: :commentable
  include Workflow
  workflow do
   state :submitted do
      event :reviewing, transitions_to: :reviewed
      event :complete, transitions_to: :completed
      event :incomplete, transitions_to: :unsatisfactory
    end
    state :reviewed do
      event :complete, transitions_to: :completed
      event :incomplete, transitions_to: :unsatisfactory
    end
    state :completed do
      event :incomplete, transitions_to: :unsatisfactory
    end
    state :unsatisfactory do
      event :complete, transitions_to: :completed
    end
  end
end
