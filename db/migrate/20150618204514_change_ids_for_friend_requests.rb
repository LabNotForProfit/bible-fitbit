class ChangeIdsForFriendRequests < ActiveRecord::Migration
  def change
  	rename_column :friend_requests, :requesting_user_id, :user_id
  	rename_column :friend_requests, :requested_user_id, :friend_id
  end
end
