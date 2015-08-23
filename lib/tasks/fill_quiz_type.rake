namespace :seed do
	desc "Fills in the Quiz Type for QuizScores that don't have one"
	task :fill_quiz_type => :environment do
		scores = QuizScore.where(quiz_type: nil)
		scores.each do |score|
			score.quiz_type = "Unknown type"
			score.save!
		end
	end
end
