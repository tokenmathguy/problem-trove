class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.references :question, :null => false
      t.references :user, :null => false
      t.string :description, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
