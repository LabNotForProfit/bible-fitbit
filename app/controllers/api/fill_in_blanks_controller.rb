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
				@passages = @biblesearch.passages(('Gen 1:1, 12:1-3, 15:5-6, 3:17-19, 50:20'), :version => "eng-ESV")
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