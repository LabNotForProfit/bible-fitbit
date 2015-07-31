class AddNumQuestionsToQuizScore < ActiveRecord::Migration
  def change
  	add_column :quiz_scores, :num_questions, :integer
  	add_column :quiz_scores, :num_correct, :integer
  	remove_column :quiz_scores, :score
  end
end
