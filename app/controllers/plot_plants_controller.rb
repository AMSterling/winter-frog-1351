class PlotPlantsController < ApplicationController
  before_action :find_plot

  def delete
    if Plot.find(params[:plot_id])
      PlotPlant.delete(params[:id])
      redirect_to '/plots'
    else
      redirect_to '/plots'
    end
  end

  private
  def find_plot
    @plot = Plot.find(params[:plot_id])
  end
end
