class LeaderboardController < ApplicationController
  before_action :require_user
  def index
    @allusers = User.all
  end
end
