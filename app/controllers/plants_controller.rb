class PlantsController < ApplicationController
  before_action :find_plot

  def delete
    Plant.delete(params[:id])
    redirect_to '/plots'
  end

  private
  def find_plot
    @plot = Plot.find(params[:plot_id])
  end
end
