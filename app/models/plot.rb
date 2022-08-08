class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plot_plants
  has_many :plants, through: :plot_plants, dependent: :delete_all

  def unique_plants
    plants.distinct.pluck(:name)
  end
end
