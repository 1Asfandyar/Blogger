# frozen_string_literal: true

# controller for setting up home page and actions
class HomeController < ApplicationController
  def index
    @post_type = params
    @pagy, @posts = pagy(Post.where(published: true).order({ published: :asc, created_at: :desc }), items: 3)
  end
end
