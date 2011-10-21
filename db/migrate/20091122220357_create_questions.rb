class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.references :user, :null => false
      t.string :title, :null => false
      t.text :body, :null => false
      t.text :html
      t.integer :question_status, :null => false, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
