class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end



  def edit
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def update
    owner = Owner.find(params[:id])
     owner.update(owner_params)
    redirect_to owner
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.valid?
      @owner.save
      flash[:message] = "You are alive!"
      redirect_to owner_path(@owner)
    else
      flash[:message] = @owner.errors.full_messages[0]
      redirect_to "/owners/new"
    end
  end

  def destroy
    @owner = Owner.find(params[:id])
    # @owner.pets.delete
    @owner.destroy
    redirect_to '/owners'
  end

  def show
    @owner = Owner.find(params[:id])
  end

  private
  def owner_params
    params.require(:owner).permit(:first_name,:last_name,:age,:email)

  end
end
