class Member < ActiveRecord::Base
 
  has_many :publications
 acts_as_authentic  do |c|
c.login_field = :surname
end
end
