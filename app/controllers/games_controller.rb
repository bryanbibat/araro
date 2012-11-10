class GamesController < ApplicationController
  before_filter :authenticate_user!
  def show
  end

  def next_day
    current_user.day += 1
    current_user.save
  end
end
