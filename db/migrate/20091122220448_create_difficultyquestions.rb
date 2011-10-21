class CreateDifficultyquestions < ActiveRecord::Migration
  def self.up
    create_table :difficultyquestions do |t|
      t.references :difficulty, :null => false
      t.references :question, :null => false
      t.references :user, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :difficultyquestions
  end
end
