class ListPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    !!user
  end

  def edit?
    record_owner?
  end

  def destroy?
    record_owner?
  end

  private

  def record_owner?
    user == record.user
  end
end
