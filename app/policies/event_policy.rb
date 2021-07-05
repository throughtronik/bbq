class EventPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def show?
    return true if record.pincode.blank?
    return true if !record.pincode.blank? && user == record.user
    return true if record.pincode_valid?(cookies["#events_#{record.id}_pincode"])

    false
  end

  def edit?
    user_is_owner?(record)
  end

  def update?
    user_is_owner?(record)
  end

  def destroy?
    user_is_owner?(record)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  private

  def user_is_owner?(record)
    user.present? && record.user == user
  end
end
