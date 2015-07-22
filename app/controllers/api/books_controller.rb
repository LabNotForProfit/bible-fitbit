class Api::BooksController < ApplicationController
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
