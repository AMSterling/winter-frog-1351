class ModifyPlantsFromPlotPlants < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key "plot_plants", "plants"
    add_foreign_key "plot_plants", "plants", on_delete: :cascade
  end
end
