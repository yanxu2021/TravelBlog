class TravelController < ApplicationController
  def index
    @travel = Travel.all
  end

  def show
    @travel = Travel.find(params[:id])
  end

  def new
    @travel = Travel.new
  end

  def create
    @travel = Travel.create(travel_params)
    if @travel.valid?
      redirect_to travels_path
    else
      redirect_to new_travel_path
    end
  end

  def destroy
    @travel = Travel.find(params[:id])
    if @travel.destroy
      redirect_to travels_path
    else
      redirect_to travels_path(@travel)
    end  
  end

  # Anything below private can only be called inside the scope of this class
  private

  def travel_params
    params.require(:travel).permit(:title, :content)
  end
end
