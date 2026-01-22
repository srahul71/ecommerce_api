class ProductPolicy < ApplicationPolicy
  def create?
    user.has_role?(:admin) || user.has_role?(:sub_admin)
  end

  def update?
    create?
  end

  def destroy?
    user.has_role?(:admin)
  end
end