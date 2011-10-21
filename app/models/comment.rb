class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :lab

  validates_associated :user, :lab
  validates_presence_of :description
  validates_length_of :description, 
    :maximum => 256
end
