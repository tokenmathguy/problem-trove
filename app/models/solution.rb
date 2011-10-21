class Solution < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  validates_associated :question, :user
  validates_presence_of :title, :body, :solution_status
  validates_length_of :title, 
    :maximum => 256
  validates_numericality_of :solution_status, 
    :only_integer => true
end
