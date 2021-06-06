require 'rails_helper'
RSpec.describe SeasonsController, type: :controller do
  before(:each) do
    create(:episode)
    create(:episode, number: 2)
    create(:movie, plot: 'Plot 1')
  end

  describe '#index' do
    it 'returns seasons ordered by its creation
      including the list of episodes by its number' do
      get :index
      expect(response.status).to eq 200
      seasons = JSON.parse(response.body)["data"]["seasons"]
      expect(response.status).to eq(200)
      expect(seasons.count).to eq(2)
    end
  end

  describe '#movies_seasons_list' do
    it 'returns movies and seasons list' do
      get :movies_seasons_list
      expect(response.status).to eq 200
      seasons = JSON.parse(response.body)["data"]["seasons"]
      movies = JSON.parse(response.body)["data"]["movies"]
      expect(response.status).to eq(200)
      expect(seasons.count).to eq(2)
      expect(movies.count).to eq(1)
    end
  end
end