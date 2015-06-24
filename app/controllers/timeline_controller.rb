class TimelineController < ApplicationController

  # User must be logged in to access anything
  before_filter :authenticate_user!
  
  def index
  	@user = current_user
  end

  def edit
  	@user = current_user
  end

  def update
    @biblesearch = BibleSearch.new('PPBuBK5LCmR4KLIsbytjtvCPDWbLkoSagxJhzQ6u')
    get_abbr(params[:book])
    get_verse(@book)
  end

  private

  # Get Chapter 1 verse 1 of book that user is editing progress for.
  def get_verse(value)
  @verse = @biblesearch.verse('eng-ESV:'+value+'.1.1')
  end

  #Get bible abbreviation of book user is editing for API call.
  def get_abbr(book)
    @abbreviations = {"Genesis"=>"Gen","Exodus"=>"Exod"}
    @abbreviations.each { |key,value| @book = value if key == params[:book] }
  end

end
