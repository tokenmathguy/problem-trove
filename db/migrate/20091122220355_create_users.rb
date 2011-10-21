class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :limit => 96, :null => false
      t.string :login, :limit => 96, :null => false
      t.string :email, :null => false
      t.string :crypted_password, :limit => 96, :null => false
      t.string :salt, :limit => 96
      t.string :remember_token, :limit => 96
      t.datetime :remember_token_expires_at
      t.string :activation_code, :limit => 96
      t.datetime :activated_at
      t.string :password_reset_code, :limit => 96
      t.boolean :enabled, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
