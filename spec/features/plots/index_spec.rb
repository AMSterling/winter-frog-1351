require 'rails_helper'

RSpec.describe 'the plot index' do
  it 'is a list of all plot numbers, names and plants' do
    turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
    library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
    other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

    tg1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    tg2 = turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
    bg1 = library_garden.plots.create!(number: 2, size: "Small", direction: "South")
    og1 = other_garden.plots.create!(number: 738, size: "Medium", direction: "West")

    cilantro = Plant.create!(name: 'Cilantro', description: 'Needs light breexe for stronger stems.', days_to_harvest: 20)
    pepper = Plant.create!(name: "Purple Beauty Sweet Bell Pepper", description: "Prefers rich, well draining soil.", days_to_harvest: 90)
    basil = Plant.create!(name: 'Basil', description: 'Needs full morning sun.', days_to_harvest: 30)
    mint = Plant.create!(name: 'Mint', description: 'Plant adjacent for pest control.', days_to_harvest: 25)
    parsley = Plant.create!(name: 'Parsley', description: 'Prefers full afternoon sun.', days_to_harvest: 40)
    squash = Plant.create!(name: 'Squash', description: 'Needs plenty of space.', days_to_harvest: 110)

    PlotPlant.create!(plot_id: tg1.id, plant_id: pepper.id)
    PlotPlant.create!(plot_id: tg1.id, plant_id: mint.id)
    PlotPlant.create!(plot_id: tg1.id, plant_id: basil.id)
    PlotPlant.create!(plot_id: tg1.id, plant_id: squash.id)
    PlotPlant.create!(plot_id: tg2.id, plant_id: cilantro.id)
    PlotPlant.create!(plot_id: tg2.id, plant_id: mint.id)
    PlotPlant.create!(plot_id: tg2.id, plant_id: parsley.id)
    PlotPlant.create!(plot_id: bg1.id, plant_id: parsley.id)
    PlotPlant.create!(plot_id: bg1.id, plant_id: parsley.id)
    PlotPlant.create!(plot_id: bg1.id, plant_id: mint.id)
    PlotPlant.create!(plot_id: og1.id, plant_id: mint.id)
    PlotPlant.create!(plot_id: og1.id, plant_id: cilantro.id)
    PlotPlant.create!(plot_id: og1.id, plant_id: basil.id)
    PlotPlant.create!(plot_id: og1.id, plant_id: squash.id)

    visit '/plots'

    expect(current_path).to eq('/plots')

    within "#plot-#{tg1.id}" do
      expect(page).to have_content('Number: 25')
      expect(page).to have_content('Plants:')

      within '#plant-0' do
        expect(page).to have_content('Purple Beauty Sweet Bell Pepper')
      end
      within '#plant-1' do
        expect(page).to have_content('Basil')
      end
      within '#plant-2' do
        expect(page).to have_content('Mint')
      end
      within '#plant-3' do
        expect(page).to have_content('Squash')
      end
    end

    within "#plot-#{tg2.id}" do
      expect(page).to have_content('Number: 26')
      expect(page).to have_content('Plants:')

      within '#plant-0' do
        expect(page).to have_content('Cilantro')
      end
      within '#plant-1' do
        expect(page).to have_content('Mint')
      end
      within '#plant-2' do
        expect(page).to have_content('Parsley')
      end
    end

    within "#plot-#{bg1.id}" do
      expect(page).to have_content('Number: 2')
      expect(page).to have_content('Plants:')

      within '#plant-0' do
        expect(page).to have_content('Mint')
      end
      within '#plant-1' do
        expect(page).to have_content('Parsley')
      end
      within '#plant-2' do
        expect(page).to have_content('Parsley')
      end
    end

    within "#plot-#{og1.id}" do
      expect(page).to have_content('Number: 738')
      expect(page).to have_content('Plants:')

      within '#plant-0' do
        expect(page).to have_content('Cilantro')
      end
      within '#plant-1' do
        expect(page).to have_content('Basil')
      end
      within '#plant-2' do
        expect(page).to have_content('Mint')
      end
      within '#plant-3' do
        expect(page).to have_content('Squash')
      end
    end
  end
end
