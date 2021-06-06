class SeasonsController < ApplicationController
  def create
  end
  # return the seasons ordered by creation, including the list of episodes ordered by its number.
  def index
    seasons = Season.all.order(:created_at).includes(:episodes)
    render_success(data: { seasons: seasons })
  end

  def movies_seasons_list
    movies = Movie.group(:created_at)
    seasons = Season.group(:created_at)
    render_success(data: { movies: movies, seasons: seasons })
  end
end
