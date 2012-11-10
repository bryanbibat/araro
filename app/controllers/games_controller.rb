class GamesController < ApplicationController
  before_filter :authenticate_user!
  def show
    if current_user.new_start?
      current_user.reset_values
    end
  end

  def next_day
    current_user.day += 1
    current_user.save
  end

  def next_week
    current_user.next_week
  end

  def reset
    current_user.prepare_reset
    redirect_to game_url, notice: "Game reset"
  end

  def tractor
    plot = current_user.plots[0]
    if current_user.actions_left < 1
      flash.now[:error] = "You do not have any actions left for the day"
      render :show
    elsif plot.plow.nil?
      # LOL only one plot
      plot.plow = "tractor"
      plot.days = 0
      plot.expected_yield *= 1.07
      current_user.actions_left -= 1
      current_user.cash -= Syspar.value_for("tractor rent") * current_user.farm_size
      current_user.save
      plot.save
      redirect_to game_url, notice: "Land plowed and seedlings planted. Tractor improved yield by 7%!"
    else
      flash.now[:error] = "You already plowed this field"
      render :show
    end
  end

  def carabao
    plot = current_user.plots[0]
    if current_user.actions_left < 1
      flash.now[:error] = "You do not have any actions left for the day"
      render :show
    elsif plot.plow.nil?
      # LOL only one plot
      plot.plow = "carabao"
      plot.days = 0
      current_user.actions_left -= 1
      current_user.cash -= Syspar.value_for("carabao rent") * current_user.farm_size
      current_user.save
      plot.save
      redirect_to game_url, notice: "Land plowed and seedlings planted."
    else
      flash.now[:error] = "You already plowed this field"
      render :show
    end
  end

  def typhoon
    damage = rand(Syspar.value_for("typhoon % max damage")- (plot.variety.flood_rating || 0)).to_f / 100
    plot = current_user.plots[0]
    plot.expected_yield *= damage
    plot.current_event = nil
    current_user.actions_left -= 1
    current_user.save
    plot.save
    if damage > 0.4
      redirect_to game_url, alert: "Your field has sustained severe damage in the typhoon!"
    elsif damage > 0.1
      redirect_to game_url, notice: "Your field has sustained considerable damage in the typhoon!"
    else
      redirect_to game_url, notice: "Your field has sustained minimal damage in the typhoon! Whew!"
    end
  end

  def machine_mill
    if current_user.actions_left < 1
      flash.now[:error] = "You do not have any actions left for the day"
      render :show
    elsif current_user.plots[0].thresher.nil?
      # LOL only one plot
      plot = current_user.plots[0]
      plot.thresher = "machine"
      current_user.actions_left -= 1
      plot.expected_yield *= (100 - Syspar.value_for("machine mill percent cut")).to_f / 100
      current_user.cash += plot.expected_yield * plot.variety.sell_price
      current_user.save
      current_user.plots[0].save
      redirect_to game_url, notice: "Field harvested and grains machine milled"
    else
      flash.now[:error] = "You already harvested this field"
      render :show
    end
  end

  def hand_mill
    if current_user.actions_left < 1
      flash.now[:error] = "You do not have any actions left for the day"
      render :show
    elsif current_user.plots[0].thresher.nil?
      # LOL only one plot
      plot = current_user.plots[0]
      plot.thresher = "hand"
      current_user.actions_left -= 1
      current_user.cash -= Syspar.value_for("hand mill cost") * current_user.farm_size
      current_user.cash += plot.expected_yield * plot.variety.sell_price
      current_user.save
      current_user.plots[0].save
      redirect_to game_url, notice: "Field harvested and grains hand milled"
    else
      flash.now[:error] = "You already harvested this field"
      render :show
    end
  end
end
