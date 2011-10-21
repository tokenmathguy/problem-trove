class CreateEffectivenessquestions < ActiveRecord::Migration
  def self.up
    create_table :effectivenessquestions do |t|
      t.references :effectiveness, :null => false
      t.references :question, :null => false
      t.references :user, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :effectivenessquestions
  end
end
