class Event < ApplicationRecord
	belongs_to :user, :foreign_key => :creator
	has_many :attendances
	has_many :attendees, :through => :attendances, :source => :user
	validates :name, presence: true , uniqueness: true
	validates :date, presence: true


	# returns if event in past
	def past_event?
		if self.date != 0
			self.date < Date.today
		else
			true
		end
	end
end
