


genres = {}
actors = {}
users = {}


def create_if_not_exists(hash, key)
  if !hash[key].present?
    hash[key] = yield
  else
    hash[key]
  end
end

def seed_image(path)
  File.open(File.join(Rails.root, "/db/seeds/images/#{path}.jpg"))
end 

def load_movies_info()
  JSON.parse(IO.read(File.join(Rails.root, "/db/seeds/movies.json")))
end

def friendly_filename(filename)
    filename.gsub(/[^\w\s_-]+/, '')
            .gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
            .gsub(/\s+/, '_')
end

#seed one admin account
create_if_not_exists(users, 'michal.zimi@gmail.com') { User.create!(email: 'michal.zimi@gmail.com', password: 'password1', password_confirmation: 'password1', admin: true) }

movies_info = load_movies_info

movies_info.each do |movie_info|
  # create missing genres
  # create missing actors
  
  m = Movie.create!(
    title: movie_info["title"],
    description: movie_info["description"],
    webpage: movie_info["webpage"],
    runtime: movie_info["runtime"],
    language: movie_info["language"],
    poster: seed_image("posters/" + friendly_filename(movie_info["title"].downcase)),
    genres: movie_info["genres"].map { |genre| create_if_not_exists(genres, genre) { Genre.create!(name: genre) } },
    crews: movie_info["crew"].map { |crew| Crew.create!(name: crew["name"], function: crew["function"], role: crew["role"]) },
    casts: movie_info["cast"].map do |cast|
      actor = create_if_not_exists(actors, cast["actor"]) {Actor.create!(name: cast["actor"])}
      Cast.create!(actor: actor, character: cast["character"])
    end,
    release_dates: movie_info["release_dates"].map { |rdate| ReleaseDate.create!(date: rdate["date"], country: rdate["country"]) },
    reviews: movie_info["reviews"].map do |review|
      user = create_if_not_exists(users, review["user"]) { User.create!(email: review["user"], password: 'password1', password_confirmation: 'password1') }
      Review.create!(headline: review["headline"], content: review["content"], user: user)
    end,

  )
  
  movie_info["ratings"].map do |rating| 
      user = create_if_not_exists(users, rating["user"]) { User.create!(email: rating["user"], password: 'password1', password_confirmation: 'password1') }
      m.rate rating["stars"].to_f, user, "score"
  end
  
end