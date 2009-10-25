class Publication < ActiveRecord::Base
validates_presence_of :title 
validates_presence_of :author
belongs_to :member, :counter_cache => true

end
