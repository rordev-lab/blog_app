class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_post, only: %i[create]
  before_action :set_comment, only: %i[show edit update destroy]

  def create
    @comment = @post.comments.build(comment_params.merge!(user_id: current_user.id))
    @comment.save
  end

  private

  def set_comment
    Comment.find(params)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:post_id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
