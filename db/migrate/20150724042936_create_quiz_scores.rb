class CreateQuizScores < ActiveRecord::Migration
  def change
    create_table :quiz_scores do |t|
      t.integer :user_id
      t.integer :book_id
      t.float :score

      t.timestamps null: false
    end
  end
end