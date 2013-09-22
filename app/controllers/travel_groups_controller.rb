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
    # @bookings = @group.suggestions.select{|s| s.vote_count > 0}
    # @suggestions = @group.suggestions.map do |suggestion|
    #   users = suggestion.votes.map(&:user_id)
    #   suggestion unless users.include?(current_user.id)
    # end
  end

  def suggestions
    group = TravelGroup.find(params["group"])
    suggestions = group.suggestions.map do |suggestion|
      users = suggestion.votes.map(&:user_id)
      suggestion unless users.include?(current_user.id)
    end


    render :json => render_to_string(:partial => 'travel_groups/suggestions_list', :locals => {suggestions: suggestions}).to_json

  end

  def bookings
    group = TravelGroup.find(params["group"])
    bookings = group.suggestions.select{|s| s.vote_count > 0}.sort_by(&:vote_count)
    render :json => render_to_string(:partial => 'travel_groups/bookings_list', :locals => {bookings: bookings}).to_json
  end

  def cast_vote
    suggestion = Suggestion.find(params["suggestion"])
    vote = suggestion.votes.new(user_id: current_user.id, choice: params["choice"] )
    if vote.save
      suggestion.vote_count += vote.choice
      suggestion.save
      render :json => {success: "true", vote: vote.choice}
    else
      render :json => {success: "false"}
    end
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
