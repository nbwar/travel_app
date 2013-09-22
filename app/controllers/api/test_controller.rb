module Api
  class TestController < ApplicationController
    respond_to :json
    def index
      respond_with User.find(:all)
    end
  end
end
