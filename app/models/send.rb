class Send < ActiveRecord::Base

	validates :message, presence :true 
	validates :phone, presence :true 
	
end
