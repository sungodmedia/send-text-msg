class Send < ActiveRecord::Base

	validates :message, presence: true
	validates :phone, presence: true
	validates :phone, format: {with: /\A(\d{10}|\(?\d{3}\)?[-.\s]\d{3}[-.\s]\d{4})\z/, message:"number is invalid, 10 digit format required"}
end
