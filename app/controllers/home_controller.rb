class HomeController < ApplicationController

	skip_before_filter :authenticate_user!, :only => [:index]

	def index
		@b = BibleGateway.new
		@b.version = :english_standard_version

		@biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')
		@book = @biblesearch.book('eng-ESV:Mark')
		@passages = @biblesearch.passages('John 15:5', :version => "eng-ESV")
	end

	def tools
		@books = Book.all.order(:order_num)
	end
end
