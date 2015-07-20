class TimelineController < ApplicationController

  # User must be logged in to access anything
  before_filter :authenticate_user!
  
  def index
  	@user = current_user
  end

  def edit
  	@user = current_user
    @books = Book.all
  end

  def update
    @biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')
    @book = Book.find_by_name(params[:book])
    # @passages = @biblesearch.passages('John 15:5', :version => "eng-ESV")
    @passages = @biblesearch.passages((@book.abbr+' '+@book.key_verse), :version => "eng-ESV")

  end
end
