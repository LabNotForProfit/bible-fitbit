class Api::FillInBlanksController < ApplicationController

	def index
		puts "Calling index"
		@books = Book.all.order(:order_num)
	end

	def create
		puts "Calling create"
		@quizScore = QuizScore.new(:user_id => current_user.id, :book_id => params[:bookId], :num_correct => params[:num_correct], :num_questions => params[:num_questions])
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
		@type = params[:type]
		@questions = @book.questions.where(questionType: @type)

		@questions = params[:count] == 'All' ? @questions.shuffle : @questions.shuffle[0..params[:count].to_i-1]

		@questions.each do |question|
			html = Nokogiri::HTML(question.verse)
			html.css(".s1").remove
			html.css("sup").remove
			question.verse = html.text
			question.verse.strip!

			answers = question.answer.split(',')

			answers.each do |answer|
				if question.questionType == "Fill In Blank"
					# question.verse.gsub!(/#{question.answer}/i, "<span class=\"answer-word\">\\0</span>")
					question.verse.sub!(/\b#{answer}\b/i, "_______")
				end
			end
		end

	end

	def update
		puts "Calling update"
	end

	def destroy
		puts "Calling destroy"
	end

end