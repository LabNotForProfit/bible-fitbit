class Api::FriendshipsController < ApplicationController

	before_action :set_friend, only: :destroy

	def index
		@friendships = current_user.friendships
		@friends = current_user.friends
		@friend_requests = current_user.friend_requests
		@in_friend_requests = current_user.friend_requests_for_me

		@friends_plus_me = @friends.to_a << current_user
		@friends_plus_me.sort_by { |user| user.books.length }
		@friends_plus_me.reverse! 
	end

	# def create
	# 	@friendship = current_user.friendships.build(:friend_id => params[:friend_id])
	# 	if @friendship.save
	# 		flash[:notice] = "Added friend"
	# 		redirect_to root_url
	# 	else
	# 		flast[:notice] = "Unable to add freind"
	# 		redirect_to root_url
	# 	end
	# end

	def destroy
		# @friendship = current_user.friendships.find(params[:id])
		# @friendship.destroy
		# flash[:notice] = "Destroyed Friendship"
		# redirect_to api_user_path(current_user)

		current_user.remove_friend(@friend)
		redirect_to api_friendships_path
	end

	private

	def set_friend
		# get the friend of this friendship
    @friend = Friendship.find(params[:id]).friend 
  end
end
