class StaticPagePolicy
  def initialize(user, record)
    raise Exceptions::NotAuthenticatedError, "must be logged in" unless user
    @user = user
    @static_page = record
    @decision_aid = @static_page.decision_aid
  end

  class Scope < Struct.new(:user, :scope, :decision_aid)
    def resolve
      decision_aid.static_pages.ordered
    end
  end

  def show?
    @user.is_superadmin || @static_page.created_by_user_id == @user.id
  end

  def create?
    true
  end

  def clone?
    @user.is_superadmin || @static_page.created_by_user_id == @user.id
  end

  def update_order?
    @user.is_superadmin || @static_page.created_by_user_id == @user.id
  end

  def update?
    @user.is_superadmin || @static_page.created_by_user_id == @user.id
  end

  def destroy?
    @user.is_superadmin || @static_page.created_by_user_id == @user.id
  end

end
