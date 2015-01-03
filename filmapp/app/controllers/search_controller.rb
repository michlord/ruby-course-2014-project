class SearchController < ApplicationController
  def index
    
    @genres_list = []
    
    new_genre = params[:new_genre]
    
    @genres_list = []
    if params[:genres_list] != nil
      @genres_list = params[:genres_list].split(";")
    end
    
    if new_genre != ""
      if @genres_list.delete(new_genre) == nil
        @genres_list << new_genre
      end
    end
    
    @genres_list.uniq!
    @genres = Genre.all
  end
end
