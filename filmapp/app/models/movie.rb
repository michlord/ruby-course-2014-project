class Movie < ActiveRecord::Base
  has_many :genres_movies
  has_many :genres, through: :genres_movies
  has_many :casts
end
