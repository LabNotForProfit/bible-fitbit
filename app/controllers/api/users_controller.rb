class Api::UsersController < ApplicationController
  # before_filter :authenticate_user!

  protect_from_forgery
  respond_to :json

  # GET /api/users
  def index
    @users = User.all

    respond_to do |format|
      format.json {
        render :json => @users.as_json
      }
      format.html {
        render 'index'
      }
    end

  end

  # GET /api/users/show/:id
  def show
    # change to User.friendly.find to use the friendly username param
    @user = User.friendly.find(params[:id])
    @book = @user.current_book

    setup_quiz_vars

    respond_to do |format|
      format.json {
        if @user.nil?
          render :json => {:status => "false", :error => "No user found with id: #{params[:id]}"}
        else
          render :json => @user.as_json
        end
      }
      format.html {
        render 'show'
      }
    end
  end

  def edit
  end

  def update
    current_user.firstname = params[:firstname]
    current_user.lastname = params[:lastname]
    current_user.email = params[:email]
    current_user.save
    respond_to do |format|
      format.json {
        render :json => {:status => "Sucessfully update user."}
      }
    end
  end

  def quiz_graph
    @user = User.find(params[:user_id])
    @book = Book.find(params[:book_id])

    setup_quiz_vars
    if request.xhr?
    	render partial: 'quiz_graph'
    end
  end


  def setup_quiz_vars
    @books = Book.all.order(:order_num)
    @score_nums = @user.score_nums(@book)
    @num_questions = @user.quiz_scores.where(book:@book).pluck(:num_questions)
    @num_correct = @user.quiz_scores.where(book: @book).pluck(:num_correct)
  end
end
