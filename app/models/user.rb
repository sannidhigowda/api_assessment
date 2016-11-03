class User < ActiveRecord::Base
		validates :name, :presence => true
	validates :age, :presence => true  
	validates :role, :presence => true 
		validates :gender, :presence => true 


end
