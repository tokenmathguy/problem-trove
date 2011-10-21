class CreateSolutions < ActiveRecord::Migration
  def self.up
    create_table :solutions do |t|
      t.references :question, :null => false
      t.references :user, :null => false
      t.string :title, :null => false
      t.text :body, :null => false
      t.text :html
      t.integer :solution_status, :null => false, :default => 1

      t.timestamps
    end
  end

  def self.down
    drop_table :solutions
  end
end
