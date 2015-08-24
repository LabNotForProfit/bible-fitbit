class Api::UsersController < ApplicationController
  # before_filter :authenticate_user!

  protect_from_forgery
  respond_to :json

  # GET /api/users
  def index
    puts "calling index"
    puts params
    @friends = current_user.friends
    @friendRequests = current_user.friend_requests
    @friendIds = @friends.pluck(:id)
    @friendRequests.each do |friendRequest|
      @friendIds << friendRequest.friend.id
    end
    @friendIds << current_user.id
    puts @friendIds.join(', ')
    @users = params.nil? ? [] : User.where(['username LIKE ? and id not in (' + @friendIds.join(', ') + ')', "%#{params[:input]}%"])

    respond_to do |format|
      format.json {
        render :json => @users.as_json(:only => [:id, :username, :firstname, :lastname], :methods => [:avatar_url])
      }
      format.html {
        render 'index'
      }
    end

  end

  # GET /api/users/show/:id
  def show
    @user = User.find(params[:id])
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
    @user = User.find(params[:id])
  end

  def update
    current_user.firstname = params[:firstname]
    current_user.lastname = params[:lastname]
    current_user.email = params[:email]
    current_user.avatar = params[:user][:avatar] if params.has_key?(:user)
    current_user.save
    redirect_to api_user_path, notice: 'Your profile has been successfully updated'
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
    @num_questions = @user.quiz_scores.where(book:@book).order(:created_at).pluck(:num_questions)
    @num_correct = @user.quiz_scores.where(book: @book).order(:created_at).pluck(:num_correct)
    @quiz_dates = @user.quiz_scores.where(book: @book).order(:created_at).pluck(:created_at)

    @quiz_dates.map! do |date|
      date.strftime("%B %-d, %Y %l:%M%P")
    end

    @quiz_types = @user.quiz_scores.where(book: @book).order(:created_at).pluck(:quiz_type)
  end
end
