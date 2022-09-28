# frozen_string_literal: true

# Main application policy
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    scope.where(id: record.id).exists?
  end

  def new?
    create?
  end

  def edit?
    update?
  end

  alias destroy? index?
  alias update? index?
  alias create? index?

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # scope for application policy
  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
