class HomeController < ApplicationController
  def index
    @top_players = User.order("cash DESC").limit(10)
  end
end
