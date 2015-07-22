class AddOrderNumToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :order_num, :integer
  end
end
