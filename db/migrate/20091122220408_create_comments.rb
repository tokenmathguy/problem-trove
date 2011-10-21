class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.references :user, :null => false
      t.references :lab, :null => false
      t.string :description, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
