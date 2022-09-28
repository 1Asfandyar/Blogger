# frozen_string_literal: true

# polices for comment controller
class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def new?
    true
  end

  def destroy?
    user_is_owner? or !@user.user?
  end

  alias update? new?
  alias vote? new?
  alias create? new?

  private

  def user_is_owner?
    user == @record.user
  end
end
