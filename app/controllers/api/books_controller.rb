class Api::BooksController < ApplicationController
  def create
    puts Book.find(params[:bookId])
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
