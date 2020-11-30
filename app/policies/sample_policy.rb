class SamplePolicy < ApplicationPolicy
  def destroy?
    user && user.admin
  end

  def create?
    user && user.admin
  end

  def new?
    user && user.admin
  end

  def update?
    user && user.admin 
  end

  def edit?
    user && user.admin
  end
end