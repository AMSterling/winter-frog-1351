class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plot_plants
  has_many :plants, through: :plot_plants, dependent: :delete_all

  def unique_plants_with_short_harvest
    plants.where("days_to_harvest < 100").distinct.pluck(:name)
  end
end
