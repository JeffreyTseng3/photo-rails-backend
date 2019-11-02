class CommentsController < ApplicationController
  before_action :authenticate_user

  def index
    @comments = Comment.all
  end

  def create
    
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      render "comments/index"
    else
      render json: { errors: @comment.errors }, status: :unprocessable_entity
    end
  end

def remove_comment

  # comment = CollectionItem.find_by(photo_id: params[:photo_id], user_id: params[:photo_id] )
  # comment.destroy
end

private

  def comment_params
    params.require(:comment).permit(:comment_body, :photo_id)
  end
end

