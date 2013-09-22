class TravelGroupsController < ApplicationController
  def new
    @travel_group = TravelGroup.new
  end

  def create
    @travel_group = TravelGroup.new(travel_params)
    @travel_group.users << current_user
    if @travel_group.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @group = TravelGroup.find(params[:id])
  end

  private

    def travel_params
      params.require(:travel_group).permit(:start_date, :end_date, :destination, :name)

    end
end
