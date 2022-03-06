class PackagePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def list_my_picked_up_packages?
    true
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    # if @package.user_id == current_user.id
    allowed_to_destroy?
  end

  private

  def allowed_to_destroy?
    @record.user == @user
  end
end
