class Offering < ActiveRecord::Base
  belongs_to :course
  belongs_to :schoolquarter
  has_many :labs

  validates_associated :course, :schoolquarter
  validates_length_of :section, 
    :maximum => 16

  def display_name
    "#{course.name} - #{schoolquarter.name}"
  end
end
