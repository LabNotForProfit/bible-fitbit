class QuizScore < ActiveRecord::Base
	belongs_to :user
	belongs_to :book

	def score
		# remember to convert to float and multiply by 100 for percent
		return (num_correct / num_questions.to_f) * 100 
	end
end
