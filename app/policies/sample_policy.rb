class SamplePolicy < ApplicationPolicy
  def test
    @test = user && user.admin
  end

  def destroy?
    user && user.admin
  end

  def create?
    user && user.admin
  end

  def new?
    @test
  end

  def update?
    user && user.admin 
  end

  def edit?
    user && user.admin
  end
end