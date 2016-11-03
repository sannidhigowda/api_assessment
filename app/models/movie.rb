class Movie < ActiveRecord::Base
	validates :title, :presence => true,length:{minimum: 2}
	validates :year, :presence => true  
	validates :rating, :presence => true,format: { with: /\A[0-9]\z/}
	validates :language, :presence => true 
	validates :actors, :presence => true 
	validates :director, :presence => true 
	validates :producer, :presence => true 

end
