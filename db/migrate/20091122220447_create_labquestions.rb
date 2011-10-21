class CreateLabquestions < ActiveRecord::Migration
  def self.up
    create_table :labquestions do |t|
      t.references :lab, :null => false
      t.references :question, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :labquestions
  end
end
