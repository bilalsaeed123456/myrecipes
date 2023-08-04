class ChefsController < ApplicationController
  def new
    @chef=Chef.new
  end
  def index
    @chefs= Chef.all
  end
  def create
    @chef=Chef.new(chef_params)
    if @chef.save
      flash[:sucess] = "Welcome #{@chef.chefname} to MyRecipe App!"
      redirect_to chef_path(@chef)
    else
       render 'new' , status: 422
    end
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:id])
    if @chef.update(chef_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to @chef
    else
      render 'edit', status: 422
    end
  end
  private
  def chef_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
  end
end
