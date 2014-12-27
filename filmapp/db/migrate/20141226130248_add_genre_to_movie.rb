class AddGenreToMovie < ActiveRecord::Migration
  def change
    add_reference :movies, :genre, index: true
    add_foreign_key :movies, :genres
  end
end
