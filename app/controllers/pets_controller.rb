class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end



  def edit
    @pet = Pet.find(params[:id])
    @owners = Owner.all
  end

  def new
    @pet = Pet.new
    @owners = Owner.all
  end

  def update
    pet = Pet.find(params[:id])
     pet.update(pet_params)
    redirect_to pet
  end

  def create
    @pet = Pet.new(pet_params)
    if @pet.valid?
      @pet.save
      flash[:message] = "You are alive and owned!!!!"
      redirect_to pet_path(@pet)
    else
      flash[:message] = @pet.errors.full_messages[0]
      redirect_to "/pets/new"
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.delete
    redirect_to '/pets'
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private
  def pet_params
    params.require(:pet).permit(:name,:category,:owner_id)

  end
end
