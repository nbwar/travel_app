class HomeController < ApplicationController
  def index
    if current_user
      @groups = current_user.travel_groups
    end
  end
end
