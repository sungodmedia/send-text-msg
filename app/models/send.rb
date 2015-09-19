class Send < ActiveRecord::Base

	validates :message, :presence => true :message => "Text message is required"
	validates :phone, :presence => true :message => "Phone number is required"
	
end
