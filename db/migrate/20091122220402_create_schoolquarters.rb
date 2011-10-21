class CreateSchoolquarters < ActiveRecord::Migration
  def self.up
    create_table :schoolquarters do |t|
      t.string :name, :limit => 32, :null => false
      t.integer :schoolyear, :null => false
      t.integer :quarter, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :schoolquarters
  end
end
