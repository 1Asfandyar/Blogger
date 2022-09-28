# frozen_string_literal: true

# suggestions for report controller
class ReportPolicy < ApplicationPolicy
  # report policy
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

  def create?
    @user.user?
  end

  def index?
    !@user.user?
  end

  def destroy?
    index?
  end

  private

  def user_is_owner?
    user == @record.user
  end
end
