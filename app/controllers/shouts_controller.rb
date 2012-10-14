class ShoutsController < ApplicationController
  before_filter :require_user, only: [:new, :create]
  
  def new
    @shout = Shout.new
  end
  
  def create
    @shout = current_user.shouts.new(params[:shout])
    if @shout.save
      logger.info "#{@shout.user.username} just posted a shout: #{@shout.content}"
      redirect_to shouts_path
    else
      logger.fatal "#{@shout.errors.inspect}"
      render :new
    end
  end
  
  def index
    if params[:from].to_s.downcase.strip == 'followed'
      user_ids = [User.first.id] + User.first.follows.collect(&:id)
      @shouts = Shout.where('user_id IN (?)', user_ids.uniq).paginate(:per_page => 20, :page => params[:page])
    else
      @shouts = Shout.order('created_at DESC').paginate(:per_page => 20, :page => params[:page])
    end
  end
end
