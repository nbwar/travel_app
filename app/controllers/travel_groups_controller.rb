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

  def join_group
    group = TravelGroup.find_by_group_code(params["group_code"])
    if group && !group.users.include?(current_user)
      group.users << current_user
      render :json => render_to_string(:partial => 'travel_groups/group', locals: {:g => group}).to_json
    elsif group && group.users.include?(current_user)
      error = "Already member of group"
      render :json => {test: error}
    else
      error = "Invalid group code"
      render :json => {test: error}
    end
  end

  private

    def travel_params
      params.require(:travel_group).permit(:start_date, :end_date, :destination, :name)

    end
end
