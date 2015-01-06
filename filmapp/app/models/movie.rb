class Movie < ActiveRecord::Base
  include PgSearch
  
  has_many :release_dates
  
  has_many :genres_movies
  has_many :genres, through: :genres_movies
  
  has_many :casts
  has_many :actors, through: :casts
  
  has_many :crews  do
    def printable
      hash = {}
      select(:function).distinct.each do |fun|
        function = fun.function
        hash[function] = []
        where(function: function).each do |person|
          hash[function] << {name: person.name, role: person.role}
        end
      end
      hash
    end
  end
  
  has_many :reviews do
    def random
      # id's are not consecutive for a movie's reviews
      # so lets use whole possible id range for the random
      # value.
      rand_id = rand (Review.count + 1)
      where("id >= ?", rand_id).first
    end
  end
  
  def director_name
    d = crews.find_by(role: 'Director')
    if d != nil
      d.name
    else
      ''
    end
  end
  
  def year
    us_release = release_dates.find_by(country: "United States")
    if us_release != nil
      us_release.date.year
    else
      m = release_dates.minimum('date')
      if m != nil
        m.year
      else
        0
      end
    end
  end
  
  ratyrate_rateable 'score'
  
  has_attached_file :poster, :styles => { :medium => "454x720>", :thumb => "185x278>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/
  
  pg_search_scope :search_by_title_scope,
    against: [:title],
    using: {
      tsearch: { prefix: true, :dictionary => "english" }
    }
  
  def self.search_by_title(query)
    if query.present?
      search_by_title_scope(query)
    else
      all
    end
  end
  
  validates :title, presence: true
  
  accepts_nested_attributes_for :genres, :crews, :casts, :release_dates #maybe add allow destroy
  
end
