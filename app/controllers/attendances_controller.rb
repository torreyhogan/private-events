class AttendancesController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		guest = User.find_by(name: params[:attendance][:guest_name])
		attendance = Attendance.new(user_id: guest.id, event_id: @event.id)
		if attendance.save
			flash[:success] = "you have added #{guest.name} to this event."
			redirect_to @event
		else
			flash[:danger] = "Please try again."
			redirect_to @event
		end

	end
end
