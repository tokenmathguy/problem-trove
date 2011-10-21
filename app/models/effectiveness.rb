class Effectiveness < ActiveRecord::Base
  has_many :effectivenessquestions
  has_many :questions, :through => :effectiveness
  
  validates_presence_of :name, :ordinal
  validates_length_of :name, 
    :maximum => 32
  validates_numericality_of :ordinal, 
    :only_integer => true, 
    :greater_than => 0
  validates_uniqueness_of :ordinal
end
