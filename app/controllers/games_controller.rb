class GamesController < ApplicationController
  before_filter :authenticate_user!
  def show
  end

  def next_day
    current_user.day += 1
    current_user.save
  end

  def next_week
    current_user.next_week
  end

  def tractor
    if current_user.actions_left < 1
      flash.now[:error] = "You do not have any actions left for the day"
      render :show
    elsif current_user.plots[0].plow.nil?
      # LOL only one plot
      current_user.plots[0].plow = "tractor"
      current_user.plots[0].days = 0
      current_user.actions_left -= 1
      current_user.save
      current_user.plots[0].save
      redirect_to game_url, notice: "Land tractor plowed and seedlings planted"
    else
      flash.now[:error] = "You already plowed this field"
      render :show
    end
  end

  def machine_mill
    if current_user.actions_left < 1
      flash.now[:error] = "You do not have any actions left for the day"
      render :show
    elsif current_user.plots[0].thresher.nil?
      # LOL only one plot
      current_user.plots[0].thresher = "machine"
      current_user.actions_left -= 1
      current_user.save
      current_user.plots[0].save
      redirect_to game_url, notice: "Field harvested and grains machine milled"
    else
      flash.now[:error] = "You already harvested this field"
      render :show
    end
  end
end
