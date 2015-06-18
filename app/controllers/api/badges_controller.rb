class Api::BadgesController < ApplicationController

  def new
  	# @badge = Badge.new
  end

  def create
  	@badge = Badge.new({:name => params[:name], :description => params[:description]})
  	@badge.save
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