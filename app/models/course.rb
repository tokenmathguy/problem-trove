class Course < ActiveRecord::Base
  has_many :offerings
  has_many :schoolquarters, :through => :offerings

  validates_presence_of :name, :code
  validates_length_of :name, 
    :maximum => 96
  validates_length_of :code, 
    :maximum => 16
end
