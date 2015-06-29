class Api::FriendRequestsController < ApplicationController
	before_action :set_friend_request, except: [:index, :create]

	def index
		@incoming = FriendRequest.where(friend: current_user)
		@outgoing = current_user.friend_requests
	end

	def create
		# Check if :friend_id is username or email
		if params[:friend_id] =~ EMAIL_REGEX
			friend = User.find_by_email(params[:friend_id])
		else
			friend = User.find_by_username(params[:friend_id]) #friendly throws an exception instead of nil, so use find_by
		end

		if friend.nil?
			render partial: "cant_find_user", locals: {user: params[:friend_id]}
		else

			@friend_request = current_user.friend_requests.new(friend: friend)

			if @friend_request.save
				if request.xhr?
					# See if we have to render the whole list or just the new item
					render partial: 'friend_request_sent', locals: { user: friend }
				else
					redirect_to api_friendships_path
				end
			else
				render json: @friend_request.errors
			end
		end
	end

	def update
		@friend_request.accept # defined in friend_request model
		redirect_to api_friendships_path # basically stays on your friends page
	end

	def destroy
		@friend_request.destroy
		redirect_to api_friendships_path
	end

	private

	def friend_requests_for(user)
    FriendRequest.where(friend: user)
  end

	def set_friend_request
		@friend_request = FriendRequest.find(params[:id])
	end
end
