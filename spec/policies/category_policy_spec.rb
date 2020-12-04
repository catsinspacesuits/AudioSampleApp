require 'rails_helper'

describe CategoryPolicy do
  subject { CategoryPolicy }
    
  permissions :new?, :create? do
    it "denies access if not admin" do
      expect(subject).not_to permit(User.new(admin: false), Category.new())
    end

    it "grants access if user is an admin" do
      expect(subject).to permit(User.new(admin: true), Category.new())
    end
  end
    
  permissions :update?, :edit? do
    it "denies access if user not admin" do
      expect(subject).not_to permit(User.new(admin: false), Category.new)
    end

    it "grants access if user admin" do
      expect(subject).to permit(User.new(admin: true), Category.new)
    end
  end
end
