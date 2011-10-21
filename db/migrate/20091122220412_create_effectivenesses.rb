class CreateEffectivenesses < ActiveRecord::Migration
  def self.up
    create_table :effectivenesses do |t|
      t.string :name, :limit => 32, :null => false
      t.integer :ordinal, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :effectivenesses
  end
end
