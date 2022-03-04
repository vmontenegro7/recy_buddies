class PickUpsController < ApplicationController
  # before_action :set_user, only: :index
  # before_action :set_package, only: [:new, :create]
  # recycler can see all his/her/their pick ups.
  # 1. user can see all his/her/their packages chosen by a given recycler.
  # user can see all of his picked up packages
  # 1. see all packages which picked-up boolean field is true and user_id on pick_up table is equal to the id of the current user.
  # recycler can create a new pick-up (when he chooses package from list)

  # def new
  #   # if current_user.id == package.user_id -> get out of here, otherwise create pickup
  #   @pickup = PickUp.new
  #   @pickup.user = @user
  #   @pickup.package = @package
  #   flash[:notice] = @pickup.errors.full_messages.to_sentence unless @pickup.save
  #   # redirect_to list_path(@list)
  # end
  # # recycler can see a specific pick-up information (a package's content and address)

  # # recycler can destroy a pick-up.
  # private

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

  # def set_package
  #   @package = package.find(params[:package_id])
  # end
  # def new; end
  # def create; end
  before_action :set_pick_up, only: [:show]

  def index
    @pick_ups = policy_scope(PickUp)
    @packages = Package.all
    @not_my_packages = @packages.reject do |package|
      package.user_id == @user
    end
    @my_pick_ups = @not_my_packages.select do |package|
      @pick_ups.each do |pick_up|
        pick_up.user_id == @user ? package : false
      end
    end
    @my_pick_ups
  end

  def show
    # @bookmark = Bookmark.new
    # @review = Review.new(list: @list)
    # we would pass the user_id and also all the packages for a given user id
    # if @package.user_id == current_user.id
    # @record.user == @user
    @packages = Package.all
    @pick_ups = @packages.select do
      @record.user == @user
    end
    # if @record.user == @user
    # end
    @pick_ups
  end

  def new
    @pick_up = PickUp.new
  end

  def create
    @pick_up = PickUp.new(pick_up_params)
    if @pick_up.save
      redirect_to pick_up_path(@pick_up)
    else
      render :new
    end
  end

  private

  def set_pick_up
    @pick_up = PickUp.find(params[:id])
  end

  def pick_up_params
    params.require(:pick_up).permit(:user_id, :package_id)
  end
end
