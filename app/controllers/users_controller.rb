class UsersController < ApplicationController

	def index
		@users = User.all 
	end

	def show
		@user = User.find(params[:id])
		@upcoming_events = @user.upcoming_events
		@previous_events = @user.previous_events
	end
	
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			log_in @user
			flash[:success] = "Welcome to the Sample App!"
			redirect_to users_url
		else
			render 'new'
		end
	end

	



	private
		def user_params
			params.require(:user).permit(:name)
		end
end
