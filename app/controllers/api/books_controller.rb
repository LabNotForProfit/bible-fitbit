class Api::BooksController < ApplicationController
  def index
    @user = current_user

    # default sort order to study-order, which uses the order_num column
    @sort_order = :order_num

    # check if there's a different book order in the params
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

  def show
    @biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')
    @book = Book.find_by_name(params[:id])
    # @passages = @biblesearch.passages('John 15:5', :version => "eng-ESV")
    @passages = @biblesearch.passages((@book.abbr+' '+@book.key_verse), :version => "eng-ESV")

    @questions = @book.questions

  end

  def create
    book = Book.find(params[:bookId])
    if book != current_user.current_book
      render partial: "layouts/alert", locals: { message: "You need to complete books in order!"}, :status => 400
    else
      current_user.books << Book.find(params[:bookId])
      respond_to do |format|
        format.json{
            render :json=> {:success => root_path}
        }
        format.html{
            redirect_to root_path
        }
      end

    end
  end
end
