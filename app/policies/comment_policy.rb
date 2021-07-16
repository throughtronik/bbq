class CommentPolicy < ApplicationPolicy
  def destroy?
    record_deletable_by_user?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
