class PlotPlantsController < ApplicationController
  before_action :find_plot_plant

  def delete
    PlotPlant.delete(params[:id])
    redirect_to '/plots'
  end

  private
  def find_plot_plant
    @plot_plant = PlotPlant.where(params[:id])
  end
end
