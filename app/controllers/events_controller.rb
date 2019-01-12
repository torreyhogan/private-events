class EventsController < ApplicationController

	def index
		@events = Event.all
		@past_events = @events.select { |event| event.past_event? } 
		@upcoming_events = @events.select { |event| !event.past_event? }
	end

	def show
		@event = Event.find(params[:id])
	end
	
	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)
		@event.creator = current_user.id if logged_in?
		if @event.save
			flash[:success] = "Post Created!"
			redirect_to events_url
		else
			render 'new'
		end
	end


	private
		def event_params
			params.require(:event).permit(:name, :date)
		end
end
