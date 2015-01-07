class CreateGenresMovies < ActiveRecord::Migration
  def change
    create_table :genres_movies do |t|
      t.references :genre, index: true
      t.references :movie, index: true

      t.timestamps null: false
    end
    add_foreign_key :genres_movies, :genres
    add_foreign_key :genres_movies, :movies
  end
end
