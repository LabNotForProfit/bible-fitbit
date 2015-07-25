class Book < ActiveRecord::Base
	# has_and_belongs_to_many :users

	has_many :studied_books
	has_many :users, through: :studied_books
	has_many :quiz_scores
	has_many :questions
end
