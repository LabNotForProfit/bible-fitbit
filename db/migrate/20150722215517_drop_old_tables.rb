class DropOldTables < ActiveRecord::Migration
  def change
  	drop_table :books_users
  	drop_table :users_books
  end
end
