class CreateLabs < ActiveRecord::Migration
  def self.up
    create_table :labs do |t|
      t.references :offering
      t.references :user, :null => false
      t.string :title, :limit => 96, :null => false
      t.integer :week

      t.timestamps
    end
  end

  def self.down
    drop_table :labs
  end
end
