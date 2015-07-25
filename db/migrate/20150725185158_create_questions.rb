class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :book_id
      t.string :reference
      t.string :verse
      t.string :questionType

      t.timestamps null: false
    end
  end
end
