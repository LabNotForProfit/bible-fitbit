class Api::FillInBlanksController < ApplicationController

	def index
		puts "Calling index"
		@books = Book.all.order(:order_num)
	end

	def create
		puts "Calling create"
		@quizScore = QuizScore.new(:user_id => current_user.id, :book_id => params[:bookId], :score => params[:score])
		@quizScore.save
		respond_to do |format|
	        format.json {
	          render :json=> {:success => 'success'}
	        }
	        format.html {
	          redirect_to root_path
	        }
	    end
	end

	def new
		puts "Calling new"
	end

	def edit
		puts "Calling edit"
	end

	def show
		puts "Calling show"
		@book = Book.find(params[:id])
		@passages = @book.questions
	end

	def update
		puts "Calling update"
	end

	def destroy
		puts "Calling destroy"
	end

end