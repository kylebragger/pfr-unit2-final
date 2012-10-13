class TagsController < ApplicationController
  def show
    @tag = Tag.find_by_name(params[:name].downcase)
    redirect_to root_path and return unless @tag
    @shouts = @tag.shouts.paginate(per_page: 20, page: params[:page])
  end
end
