class PackagesController < ApplicationController
  # authorize @package
  before_action :set_package, only: %i[show destroy]

  def index
    @packages = policy_scope(Package)
  end

  def show
    authorize @package
  end

  def new
    @package = Package.new
    authorize @package
  end

  def create
    @package = Package.new(packages_params)
    @package.user = current_user
    authorize @package
    if @package.save
      redirect_to @package, notice: 'Recycle package was successfully created.'
    else
      render :new
    end
  end

  def destroy
    authorize @package
    @package.destroy
    redirect_to packages_url, notice: 'Recycle package was successfully deleted.'
  end

  def list_my_picked_up_packages
    # @packages = policy_scope(Package)
    @packages = authorize Package.all
    @my_packages = @packages.select{ |package| package.picked_up == true && package.user_id == current_user.id }
    # raise
    @my_packages
  end
  private

  def set_package
    @package = Package.find(params[:id])
  end

  def packages_params
    # if it is coming from the form, you need to have it here.
    params.require(:package).permit(:address, :content)
  end
end
