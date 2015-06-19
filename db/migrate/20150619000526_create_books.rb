class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name

      t.timestamps null: false

    create_table :books_users, id: false do |t|
    t.integer :user_id
    t.integer :book_id
    end

    add_index :books_users, :user_id
    add_index :books_users, :book_id
    end
  end
end
