class Difficulty < ActiveRecord::Base
  has_many :difficultyquestions
  has_many :questions, :through => :difficultyquestions

  validates_presence_of :name, :ordinal
  validates_length_of :name, 
    :maximum => 32
  validates_numericality_of :ordinal, 
    :only_integer => true, 
    :greater_than => 0
  validates_uniqueness_of :ordinal
end
