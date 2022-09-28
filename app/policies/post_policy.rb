# frozen_string_literal: true

# defining policy for Post controller
class PostPolicy < ApplicationPolicy
  # policy for post
  class Scope < Scope
    def resolve
      scope.where(published: true).or(scope.where(user_id: @user.try(:id)))
    end
  end

  def index?
    @user.user? or unpublish?
  end

  def new?
    !@user.admin?
  end

  def edit?
    user_is_owner?
  end

  def unpublish?
    !@user.user?
  end

  def destroy?
    user_is_owner? or unpublish?
  end

  alias show? index?
  alias vote? index?
  alias create? new?
  alias update? edit?
  alias publish? unpublish?

  private

  def user_is_owner?
    user == @record.user
  end
end
