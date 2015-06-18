class Api::FriendshipsController < ApplicationController

	def create
		@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
		if @friendship.save
			flash[:notice] = "Added friend"
			redirect_to root_url
		else
			flast[:notice] = "Unable to add freind"
			redirect_to root_url
		end
	end

	def destroy
		@friendship = current_user.friendships.find(params[:id])
		@friendship.destroy
		flash[:notice] = "Destroyed Friendship"
		redirect_to api_user_path(current_user)
	end
end
