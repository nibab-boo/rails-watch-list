class BookmarkPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user == record.list.user
  end

  def destroy?
    user == record.list.user
  end
end
