class HomeController < ApplicationController
  before_action :non_admin_access!, if: :user_signed_in?
  
  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 10)
    respond_to do |format|
      format.html { render "posts/index" }
    end
  end
end
