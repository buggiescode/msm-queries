class MoviesController < ApplicationController
  def index
    render({ :template => "movie_templates/list"})
  end

  def show
    movie_id = params.fetch("movie_id")

    matching_movies = Movie.where({:id => movie_id})
    @movie = matching_movies.first

    @director = Director.where({ :id => @movie.director_id }).first

    render({ :template => "movie_templates/details"})
  end
end
