class SearchController < ApplicationController
  def index
    @query = params[:query]
    
    @genres_list = []
    
    new_genre = params[:new_genre] || ""
    
    @genres_list = []
    if params[:genres_list] != nil
      @genres_list = params[:genres_list].split(";")
    end
    
    if new_genre != ""
      if @genres_list.delete(new_genre) == nil
        @genres_list << new_genre
      end
    end
    
    @genres_list = @genres_list.first(10)
    @genres_list.uniq!
    @genres = Genre.all
    
    if !@genres_list.empty?
      # This ORs the genre name condtitions.
      # @movies = Movie.joins(:genres).merge(Genre.where(name: @genres_list)).uniq
      
      m = Movie.joins(:genres).pluck(:movie_id)
      @genres_list.each do |g|
        m &= Movie.joins(:genres).where(genres: {name: g}).pluck(:movie_id)
      end
      @movies = Movie.search_by_title(@query).where(id: m)
    else
      @movies = Movie.search_by_title(@query)
    end
    
    @movies = @movies.paginate(page: params[:page] , per_page: 5)
  end
end
