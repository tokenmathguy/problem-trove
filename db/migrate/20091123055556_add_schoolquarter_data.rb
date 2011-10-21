class AddSchoolquarterData < ActiveRecord::Migration
  def self.up
    Schoolquarter.create(
      :name => "2005wi", 
      :schoolyear => 2005, 
      :quarter => 1)

    Schoolquarter.create(
      :name => "2005sp", 
      :schoolyear => 2005, 
      :quarter => 2)

    Schoolquarter.create(
      :name => "2005su", 
      :schoolyear => 2005, 
      :quarter => 3)

    Schoolquarter.create(
      :name => "2005au", 
      :schoolyear => 2005, 
      :quarter => 4)

    Schoolquarter.create(
      :name => "2006wi", 
      :schoolyear => 2006, 
      :quarter => 1)

    Schoolquarter.create(
      :name => "2006sp", 
      :schoolyear => 2006, 
      :quarter => 2)

    Schoolquarter.create(
      :name => "2006su", 
      :schoolyear => 2006, 
      :quarter => 3)

    Schoolquarter.create(
      :name => "2006au", 
      :schoolyear => 2006, 
      :quarter => 4)

    Schoolquarter.create(
      :name => "2007wi", 
      :schoolyear => 2007, 
      :quarter => 1)

    Schoolquarter.create(
      :name => "2007sp", 
      :schoolyear => 2007, 
      :quarter => 2)

    Schoolquarter.create(
      :name => "2007su", 
      :schoolyear => 2007, 
      :quarter => 3)
    
    Schoolquarter.create(
      :name => "2007au", 
      :schoolyear => 2007, 
      :quarter => 4)

    Schoolquarter.create(
      :name => "2008wi", 
      :schoolyear => 2008, 
      :quarter => 1)

    Schoolquarter.create(
      :name => "2008sp", 
      :schoolyear => 2008, 
      :quarter => 2)

    Schoolquarter.create(
      :name => "2008su", 
      :schoolyear => 2008, 
      :quarter => 3)

    Schoolquarter.create(
      :name => "2008au", 
      :schoolyear => 2008, 
      :quarter => 4)

    Schoolquarter.create(
      :name => "2009wi", 
      :schoolyear => 2009, 
      :quarter => 1)

    Schoolquarter.create(
      :name => "2009sp", 
      :schoolyear => 2009, 
      :quarter => 2)

    Schoolquarter.create(
      :name => "2009su", 
      :schoolyear => 2009, 
      :quarter => 3)

    Schoolquarter.create(
      :name => "2009au", 
      :schoolyear => 2009, 
      :quarter => 4)

    Schoolquarter.create(
      :name => "2010wi", 
      :schoolyear => 2010, 
      :quarter => 1)
  end

  def self.down 
    Schoolquarter.delete_all
  end
end
