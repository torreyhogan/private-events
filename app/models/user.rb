class User < ApplicationRecord
	has_many :created_events, :foreign_key => :creator, class_name: "Event"
	validates :name, presence: true , uniqueness: true
end
