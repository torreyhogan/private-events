class User < ApplicationRecord
	has_many :created_events, :foreign_key => :creator, class_name: "Event"
	has_many :attendances
	has_many :attend_events, :through => :attendances, :source => :event
	validates :name, presence: true , uniqueness: true

	def upcoming_events
		if has_events?
			self.attend_events.select { |event| !event.past_event? }
		end
	end

	def previous_events
		if has_events?
			self.attend_events.select { |event| event.past_event? }
		end
	end

	def has_events?
		self.attend_events.any?
	end





end
