class Schoolquarter < ActiveRecord::Base
  has_many :offerings
  has_many :courses, :through => :offerings
  
  validates_presence_of :name, :schoolyear, :quarter
  validates_length_of :name, 
    :maximum => 32
  validates_numericality_of :schoolyear, :quarter, 
    :only_integer => true
end
