class PlantsController < ApplicationController
  before_action :find_plot

  def show
    @plant = Plant.find(params[:id])
  end

  def delete
    if @plot
      Plant.delete(params[:id])
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
