class CreateOfferings < ActiveRecord::Migration
  def self.up
    create_table :offerings do |t|
      t.references :course, :null => false
      t.references :schoolquarter, :null => false
      t.string :section, :limit => 16

      t.timestamps
    end
  end

  def self.down
    drop_table :offerings
  end
end
