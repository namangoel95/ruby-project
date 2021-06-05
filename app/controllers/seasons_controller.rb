class SeasonsController < ApplicationController
  def create
  end

  def index
    seasons = Season.all.order(:created_at).includes(:episodes)
    render_success(data: { seaons: seasons })
  end

  def movies_seasons
    movies = Movie.group(:created_at)
    seasons = Season.group(:created_at)
    render_success(data: { movie: movies, seasons: seasons })
  end
end
