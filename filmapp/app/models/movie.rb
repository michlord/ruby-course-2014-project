class Movie < ActiveRecord::Base
  has_many :genres_movies
  has_many :genres, through: :genres_movies
  has_many :casts
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
  has_many :release_dates
  def year
    us_release = release_dates.find_by(country: "United States")
    if us_release != nil
      us_release.date.year
    else
      release_dates.minimum('date').year
    end
  end
  ratyrate_rateable 'score'
  has_attached_file :poster, :styles => { :medium => "454x720>", :thumb => "185x278>" }, :default_url => ":style/missing.png"
  validates_attachment_content_type :poster, :content_type => /\Aimage\/.*\Z/
  has_many :reviews
end
