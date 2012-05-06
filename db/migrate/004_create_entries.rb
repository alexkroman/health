class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.column :title, :string
      t.column :notes, :text
      t.column :breakfast, :text
      t.column :lunch, :text
      t.column :dinner, :text
      t.column :snacks, :text
      t.column :workouts, :text
      t.column :created_on, :date
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :entries
  end
end
