class SamplePolicy < ApplicationPolicy
  def admin_permission
    @admin_permission = user && user.admin == true 
  end

  def destroy?
    @admin_permission
  end

  def create?
    @admin_permission
  end

  def new?
    @admin_permission
  end

  def update?
    @admin_permission 
  end

  def edit?
    @admin_permission
  end
end