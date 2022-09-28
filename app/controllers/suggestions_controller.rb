# frozen_string_literal: true

# suggestions controller
class SuggestionsController < ApplicationController
  def new
    @post = Post.find_by(id: params[:id])
    @suggestion = @post.suggestions.build
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    authorize @suggestion
    respond_to do |format|
      if @suggestion.save
        format.html { redirect_back(fallback_location: posts_url) }
      else
        format.html { redirect_to home_path, alert: t('.alert') }
      end
    end
  end

  def index
    authorize Suggestion
    @posts = current_user.posts
  end

  def destroy
    @suggestion = Suggestion.find_by(id: params[:id])
    authorize @suggestion

    respond_to do |format|
      if @suggestion.destroy
        format.html { redirect_to suggestions_url, notice: t('.notice') }
      else
        format.html { redirect_to home_path, alert: t('.alert') }
      end
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:body, :post_id, :parent_id, :user_id)
  end
end
