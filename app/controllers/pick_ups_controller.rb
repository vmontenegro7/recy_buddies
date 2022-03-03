class PickUpsController < ApplicationController
  # recycler can see all his/her/their pick ups.
  def index
    @pickups
  end
  # 1. user can see all his/her/their packages chosen by a given recycler.
  # 1. see all packages which picked-up boolean field is true and user_id on pick_up table is equal to the id of the current user.
  # recycler can create a new pick-up (when he chooses package from list)

  def new
    # if current_user.id == package.user_id -> get out of here, otherwise create pickup
    @pickup = Pickup.new
    @pickup.user = @user
    @pickup.package = @package
    flash[:notice] = @pickup.errors.full_messages.to_sentence unless @pickup.save
    # redirect_to list_path(@list)
  end
  # recycler can see a specific pick-up information (a package's content and address)

  # recycler can destroy a pick-up.
  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_package
    @package = package.find(params[:package_id])
  end
end
