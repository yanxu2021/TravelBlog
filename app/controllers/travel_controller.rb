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
end
