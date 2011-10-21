class Note < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates_associated :question, :user
  validates_presence_of :description
  validates_length_of :description, 
    :maximum => 256
end
