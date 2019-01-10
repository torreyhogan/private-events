class Event < ApplicationRecord
	belongs_to :user, :foreign_key => :creator
	has_many :attendances
	has_many :attendees, :through => :attendances, :source => :user
	validates :name, presence: true , uniqueness: true
	validates :date, presence: true
end
