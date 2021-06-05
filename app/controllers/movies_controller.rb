class MoviesController < ApplicationController
  def create
    movie = Movie.new(plot: params[:plot], title: params[:plot])
    if movie.save
      render_success(data: {movie: movie},
                     message: 'Movie created Successfully', model_name: 'Movie'), status: :created)
    else
      render_error(message: 'Movie cant be created', model_name: 'Movie'), errors: movie.errors,
        status: :unprocessable_entity)
    end
  end

  # An endpoint to return the movies, ordered by creation.
  def index
    movies = Movie.order(:created_at)
    render_success(data: { movies: movies) })
  end
end
