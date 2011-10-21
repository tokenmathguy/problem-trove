class Difficultyquestion < ActiveRecord::Base
  belongs_to :difficulty
  belongs_to :question
  belongs_to :user

  validates_associated :difficulty, :question, :user
end
