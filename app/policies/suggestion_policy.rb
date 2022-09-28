# frozen_string_literal: true

# policies for suggestion controller
class SuggestionPolicy < ApplicationPolicy
  # suggestion policy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if !user.user?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

  def index?
    @user.user? or @user.admin? or @user.moderator?
  end

  alias create? index?
  alias new? index?
  alias destroy? index?

  private

  def user_is_owner?
    user == @record.user
  end
end
