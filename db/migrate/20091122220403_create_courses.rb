class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string :name, :limit => 96, :null => false
      t.string :code, :limit => 16, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
