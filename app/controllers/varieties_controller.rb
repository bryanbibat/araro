class VarietiesController < ApplicationController
  def index
    @varieties = Variety.all
  end

  def show
    @variety = Variety.find(params[:id])
  end
end
