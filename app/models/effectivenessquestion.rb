class Effectivenessquestion < ActiveRecord::Base
  belongs_to :effectiveness
  belongs_to :question
  belongs_to :user

  validates_associated :effectiveness, :question, :user
end
