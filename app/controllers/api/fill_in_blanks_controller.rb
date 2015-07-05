class Api::FillInBlanksController < ApplicationController

	def index
		puts "Calling index"
		@books = Book.all
	end

	def create
		puts "Calling create"
	end

	def new
		puts "Calling new"
	end

	def edit
		puts "Calling edit"
	end

	def show
		puts "Calling show"
		@biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')
		@passages = []
		case params[:id]
			when 'Genesis'
				@passages = @biblesearch.passages(('Gen 1:1, 12:1-3, 15:5-6, 3:17-19, 50:20, 1:27-28, 2:23-25, 4:9, 6:3, 7:10, 8:13, 11:3-4, 13:8-9, 14:19-20, 16:6, 17:5, 17:17, 18:13-15, 19:17, 19:26, 20:17, 21:6, 21:16, 22:14, 23:6, 24:56, 25:23, 25:34, 27:33, 28:12, 29:15-16, 30:2, 30:35-36, 31:14-16, 32:3, 32:26, 33:4, 34:9-10, 35:6-7, 37:9, 37:21, 38:26, 39:8-9, 41:16, 42:24, 43:9, 44:12, 44:32-33, 45:7, 48:14'), :version => "eng-ESV")
			else
				puts 'Unknown book'
		end
	end

	def update
		puts "Calling update"
	end

	def destroy
		puts "Calling destroy"
	end

end