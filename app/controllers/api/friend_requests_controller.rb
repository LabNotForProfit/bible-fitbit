class Api::FriendRequestsController < ApplicationController
	before_action :set_friend_request, except: [:index, :create]

	def index
		@incoming = FriendRequest.where(friend: current_user)
		@outgoing = current_user.friend_requests
	end

	def create
		friend = User.friendly.find(params[:friend_id])
		@friend_request = current_user.friend_requests.new(friend: friend)

		if @friend_request.save
			# render :show, status: :created, location: @friend_request
			if request.xhr?
				render partial: "waiting_for_friend", locals: {request: @friend_request}
			else
				redirect_to api_friendships_path
			end
			# redirect_to api_user_path(friend)
		else
			render json: @friend_request.errors
		end
	end

	def update
		@friend_request.accept # defined in friend_request model
		redirect_to api_user_path(@friend_request.friend) # basically stays on your own page as it goes back to the requested user's page
	end

	def destroy
		@friend_request.destroy
		redirect_to api_user_path(@friend_request.friend)
	end

	private

	def friend_requests_for(user)
    FriendRequest.where(friend: user)
  end

	def set_friend_request
		@friend_request = FriendRequest.find(params[:id])
	end
end
