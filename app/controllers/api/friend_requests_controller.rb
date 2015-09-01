class Api::FriendRequestsController < ApplicationController
	before_action :set_friend_request, except: [:index, :create]

	def index
		@incoming = FriendRequest.where(friend: current_user)
		@outgoing = current_user.friend_requests
	end

	def create
		puts 'calling create'
		puts params
		# Check if :friend_id is username or email
		puts params[:friend_id]
		if params[:friend_id] =~ EMAIL_REGEX
			friend = User.find_by_email(params[:friend_id])
		else
			friend = User.find_by_username(params[:friend_id]) #friendly throws an exception instead of nil, so use find_by
		end

		if friend.nil?
			render partial: "layouts/alert", locals: { message: "We can't find #{params[:friend_id]} in the system!" }
		else

			@friend_request = current_user.friend_requests.new(friend: friend)

			if @friend_request.save
				if request.xhr?
					# Render the successfull friend request sent partial
					render partial: 'layouts/notice', locals: { message: "Friend request sent to #{friend.firstname}" }
				else
					redirect_to api_user_path(friend)
				end
			else
				if request.xhr?
					# Figure out what error it was
					if @friend_request.not_self
						render partial: 'layouts/alert', locals: { message: "You can't send a friend request to yourself!" }
					elsif @friend_request.not_pending_from
						render partial: 'layouts/alert', locals: { message: "You were already sent a friend request from #{friend.firstname}!" }
					elsif @friend_request.not_pending_to
						render partial: 'layouts/alert', locals: { message: "You already sent a friend request to #{friend.firstname}!" }							
					elsif @friend_request.not_friends
						render partial: 'layouts/alert', locals: { message: "You are already friends with #{friend.firstname}!" }
					else
						render partial: 'layouts/alert', locals: { message: "Something bad happened, and I can't tell you what!" }
					end
				else
					render json: @friend_request.errors
				end
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
