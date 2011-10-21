class Labquestion < ActiveRecord::Base
  belongs_to :lab
  belongs_to :question

  validates_associated :lab, :question
end
