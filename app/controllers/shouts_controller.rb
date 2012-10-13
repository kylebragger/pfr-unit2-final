class ShoutsController < ApplicationController
  def new
    @shout = Shout.new
  end
  
  def create
    @shout = Shout.new(params[:shout])
    @shout.user = User.first
    if @shout.save
      redirect_to shouts_path
    else
      render :new
    end
  end
  
  def index
    @shouts = Shout.order('created_at DESC').paginate(:per_page => 20, :page => params[:page])
  end
end
