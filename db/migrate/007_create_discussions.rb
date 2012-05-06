class CreateDiscussions < ActiveRecord::Migration
  def self.up
    create_table :discussions do |t|
      t.column :title, :string
      t.column :body, :text
      t.column :created_at, :datetime
      t.column :user_id, :integer
      t.column :group_id, :integer
      t.column :comments_count, :integer
    end
  end

  def self.down
    drop_table :discussions
  end
end
