class CuisinesController < ApplicationController
  def show
    @cuisine = Cuisine.find(params[:id])
    @recipes = Recipe.where("cuisine_id = #{params[:id]}")
  end
  def new
    @cuisine = Cuisine.new
  end
  def create
    @cuisine = Cuisine.new(receive_params)
    if @cuisine.save
    redirect_to @cuisine
    else
      flash[:error] = 'Você deve informar o nome da cozinha'
      render :new
    end
  end

  private

  def receive_params
    params.require(:cuisine).permit(:name)
  end
end
