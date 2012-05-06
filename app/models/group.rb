class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, :through => :memberships
  has_many :discussions, :order => 'created_at DESC'
  
  def entries
    Entry.find(:all, 
               :include => { :user => :memberships }, 
               :conditions => ['memberships.group_id = ?', self.id], 
               :order => 'entries.created_on DESC, entries.id DESC')
  end

end
