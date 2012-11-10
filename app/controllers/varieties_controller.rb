class VarietiesController < ApplicationController
  def index
    @varieties = Variety.all
  end

  def show
    @variety = Variety.find(params[:id])
  end

  def plant
    @variety = Variety.find(params[:id])
    if current_user.actions_left < 1
      flash.now[:error] = "You do not have any actions left for the day"
      render :show
    elsif current_user.has_available_land?
      current_user.plots.create({variety: @variety})
      current_user.actions_left -= 1
      current_user.save
      redirect_to game_url, notice: "Seedlings bought and plot set aside for planting"
    else
      flash.now[:error] = "You do not have any available land at the moment"
      render :show
    end
  end
end
