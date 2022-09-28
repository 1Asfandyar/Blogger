# frozen_string_literal: true

# comments controller
class CommentsController < ApplicationController
  before_action :set_comment, only: %i[update destroy vote]
  before_action :set_post, only: %i[new create]

  def new
    @comment = Comment.new
    authorize @comment
  end

  def create
    authorize Comment
    @comment = @post.comments.new(comment_params)
    @comment.save
  end

  def destroy
    @comment = Comment.find_by(id: params[:post_id])
    @comment.destroy
  end

  def vote
    if !current_user.liked? @comment
      @comment.liked_by current_user
    elsif current_user.liked? @comment
      @comment.unliked_by current_user
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find_by(id: params[:post_id])
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:body, :parent_id, :image, :user_id)
  end
end
