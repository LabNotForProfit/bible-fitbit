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
		@biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')
		@passages = []
		case @book.name
			when 'Genesis'
				@passages = @biblesearch.passages(('Gen 1:1, 12:1-3, 15:5-6, 3:17-19, 50:20, 1:27-28, 2:23-25, 4:9, 6:3, 7:10, 8:13, 11:3-4, 13:8-9, 14:19-20, 16:6, 17:5, 17:17, 18:13-15, 19:17, 19:26, 20:17, 21:6, 21:16, 22:14, 23:6, 24:56, 25:23, 25:34, 27:33, 28:12, 29:15-16, 30:2, 30:35-36, 31:14-16, 32:3, 32:26, 33:4, 34:9-10, 35:6-7, 37:9, 37:21, 38:26, 39:8-9, 41:16, 42:24, 43:9, 44:12, 44:32-33, 45:7, 48:14'), :version => "eng-ESV")

			when 'Romans'
				@passages = @biblesearch.passages(('Rom 3:1-2, 7:8, 1:14, 9:3, 12:9-11, 14:3, 16:25-27, 1:16, 4:2-3, 10:9, 6:23, 8:31-32, 13:1, 1:18, 9:20, 13:8, 15:20, 3:23-24, 14:20-21, 12:4-5, 2:4, 4:17-18, 5:3-5, 8:1, 3:10-12, 7:24, 1:24-25, 5:1-2, 10:14-15, 8:16-17, 11:17-18, 6:1-2, 6:12-13, 15:1-2, 3:20, 2:28-29, 16:3-4, 14:7-8, 6:7, 5:6-8'), :version => "eng-ESV")

			when '1 Corinthians'
				@passages = @biblesearch.passages(('1Cor 9:22, 10:31, 6:12, 1:26, 8:9, 15:19, 14:20, 2:2, 3:1-2, 15:58, 3:16, 12:18, 4:15, 12:26, 5:12, 13:4, 3:6-7, 1:18, 11:3, 6:19-20, 4:20, 8:1, 1:31, 14:19, 4:7, 9:27, 10:13, 1:12, 11:1, 14:12, 12:4-5, 9:19, 15:1-2, 6:11, 13:12, 3:10, 15:3, 1:27, 7:29-31, 6:18'), :version => "eng-ESV")

			when '2 Timothy'
				@passages = @biblesearch.passages(('2Tim 1:6, 1:7, 1:13-14, 1:15, 1:16-18, 2:1-2, 2:3-4, 2:5-6, 2:8-9, 2:11-13, 2:15, 2:16-18, 2:19, 2:20-21, 2:22, 2:23, 2:24-26, 3:1, 3:2-5, 3:7, 3:8-9, 3:10-11, 3:12-13, 3:14-15, 3:16-17, 4:2, 4:3-4, 4:5, 4:6-8, 4:16-18'), :version => "eng-ESV")

			else
				@passages = @biblesearch.passages((''), :version => "eng-ESV")
		end
	end

	def update
		puts "Calling update"
	end

	def destroy
		puts "Calling destroy"
	end

end