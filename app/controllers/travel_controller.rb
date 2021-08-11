class TravelController < ApplicationController
  def index
    @travel = Travel.all
end
end
