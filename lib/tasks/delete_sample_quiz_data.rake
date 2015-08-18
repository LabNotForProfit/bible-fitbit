namespace :seed do
	desc "Delte all the sample quiz data from the database where the book is nil"
	task :delete_sample_quiz => :environment do
		QuizScore.where(book: nil).delete_all
	end
end