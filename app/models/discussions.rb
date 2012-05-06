class Discussions < ActiveRecord::Base
  belongs_to :group, :counter_cache => true
end
