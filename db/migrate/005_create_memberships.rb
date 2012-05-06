class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table :memberships do |t|
      t.column :user_id, :integer
      t.column :group_id, :integer
    end
  end

  def self.down
    drop_table :memberships
  end
end
