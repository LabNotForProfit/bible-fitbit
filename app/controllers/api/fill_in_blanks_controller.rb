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
		@passages = @book.questions.where(questionType: @type)

		@passages = params[:count] == 'All' ? @passages.shuffle : @passages.shuffle[0..params[:count].to_i-1]

		@passages.each do |passage|
			html = Nokogiri::HTML(passage.verse)
			html.css(".s1").remove
			html.css("sup").remove
			passage.verse = html.text
			passage.verse.strip!

			if passage.questionType == "Fill In Blank"
				# passage.verse.gsub!(/#{passage.answer}/i, "<span class=\"answer-word\">\\0</span>")
				passage.verse.gsub!(/\b#{passage.answer}\b/i, "_______")
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