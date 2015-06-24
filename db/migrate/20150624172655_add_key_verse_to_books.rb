class AddKeyVerseToBooks < ActiveRecord::Migration
  def change
    add_column :books, :key_verse, :string
  end
end
