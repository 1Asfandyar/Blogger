# frozen_string_literal: true

# PostController with crud actions
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy publish unpublish vote]
  after_action :verify_authorized, except: :index
  after_action :verify_policy_scoped, only: :idex

  def index
    @post_type = params
    @pagy, @posts = pagy(
      (Post.get_ordered_posts(current_user) if params[:allposts]))
  end

  def show; end

  def new
    @post = current_user.posts.build
    authorize @post
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    authorize @post

    respond_to do |format|
      if @post.save
        format.html { redirect_to home_path, notice: t('.notice') }
      else
        format.html { redirect_to home_path, alert: t('.alert') }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to home_path, notice: t('.notice') }
      else
        format.html { redirect_to home_path, alert: t('.alert')  }
      end
    end
  end

  def publish
    respond_to do |format|
      if @post.update(published: true)
        format.html { redirect_to post_path(@post), notice: t('.notice') }
      else
        format.html { redirect_to post_path(@post), alert: t('.alert') }
      end
    end
  end

  def unpublish
    respond_to do |format|
      if @post.update(published: false)
        format.html { redirect_to post_path(@post), notice: t('.notice') }
      else
        format.html { redirect_to post_path(@post), alert: t('.alert') }
      end
    end
  end

  def vote
    if !current_user.liked? @post
      @post.liked_by current_user
    elsif current_user.liked? @post
      @post.unliked_by current_user
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :content, :description)
  end
end
