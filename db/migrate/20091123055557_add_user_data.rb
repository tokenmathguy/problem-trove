class AddUserData < ActiveRecord::Migration
  def self.up
    User.create(
      :name => "Eric Johnson", 
      :login => "edj371", 
      :email => "edj371@u.washington.edu", 
      :crypted_password => "e1d55e921d015db7b034457897c533f8e2d5499b", 
      :salt => "1b6453892473a467d07372d45eb05abc2031647a")

    User.create(
      :name => "batman", 
      :login => "batman", 
      :email => "batman@example.com", 
      :crypted_password => "1aedce0245f2eeb46d3d12cc660268dd58a62be2", 
      :salt => "ac3478d69a3c81fa62e60f5c3696165a4e5e6ac4")

    User.create(
      :name => "saltydog", 
      :login => "saltydog", 
      :email => "salty_dog@example.com", 
      :crypted_password => "00742970dc9e6319f8019fd54864d3ea740f04b1", 
      :salt => "7e3041ebc2fc05a40c60028e2c4901a81035d3cd")
  end

  def self.down
    User.delete_all
  end
end
