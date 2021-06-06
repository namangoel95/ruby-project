require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  before(:each) do
    create(:movie, plot: 'Plot 1')
    create(:movie, plot: 'Plot 2')
  end

  describe '#index' do
    it 'return the movies ordered by creation' do
      get :index
      expect(response.status).to eq 200
      movies = JSON.parse(response.body)["data"]["movies"]
      expect(response.status).to eq(200)
      expect(movies.count).to eq(1)
    end
  end
end
