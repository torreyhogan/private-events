class User < ApplicationRecord
	has_many :created_events, :foreign_key => :creator, class_name: "Event"
	has_many :attendances
	has_many :attend_events, :through => :attendances, :source => :event
	validates :name, presence: true , uniqueness: true
end
