class TimelineController < ApplicationController

  # User must be logged in to access anything
  before_filter :authenticate_user!
  
  def index
  	@user = current_user
  end

  def edit
  	@user = current_user

    # default sort order to study-order, which uses the order_num column
    @sort_order = :order_num

    unless params[:sort_order].nil?
      if params[:sort_order] == "Book Order"
        @sort_order = :id # Book order is just the database id order as well
      end
    end

    @books = Book.all.order(@sort_order)

    if request.xhr?
      render partial: "book_wall"
    end
  end

  def update
    @biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')
    @book = Book.find_by_name(params[:book])
    # @passages = @biblesearch.passages('John 15:5', :version => "eng-ESV")
    @passages = @biblesearch.passages((@book.abbr+' '+@book.key_verse), :version => "eng-ESV")

  end
end
