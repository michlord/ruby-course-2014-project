require 'date'
movies_info = [
  {
    title: "Gone Girl",
    description: "With his wife's disappearance having become the focus of an intense media circus, a man sees the spotlight turned on him when it's suspected that he may not be innocent.",
    webpage: "http://www.gonegirlmovie.com/",
    runtime: 145,
    language: "English",
    genres: [ "Drama", "Thriller" ],
    release_dates: [ { date: Date.new(2014, 10, 3), country: "United States" }, { date: Date.new(2014, 10, 9), country: "Poland" } ],
    cast: [
      { actor: "Ben Affleck", character: "Nick Dunne" },
      { actor: "Tyler Perry", character: "Amy Dunne" },
      { actor: "Rosamund Pike", character: "Tanner Bolt" },
      { actor: "Neil Patrick Harris", character: "Desi Collins" },
      { actor: "Missi Pyle", character: "Ellen Abbott" },
      { actor: "Patrick Fugit", character: "Detective Jim Gulpin" },
      { actor: "Kim Dickens", character: "Detective Rhonda Boney" },
      { actor: "Casey Wilson", character: "Noelle Hawthorne" },
      { actor: "Kathleen Rose Perkins", character: "Shawna Kelly" },
      { actor: "Emily Ratajkowski", character: "Andie Hardy" },
      { actor: "Scoot McNairy", character: "Tommy" },
      { actor: "Boyd Holbrook", character: "Jeff" },
      { actor: "Carrie Coon", character: "Margo Dunne" }
    ],
    crew: [
      { name: "David Fincher", function: "Directing", role: "Director" },
      { name: "Gillian Flynn", function: "Writing", role: "Novel" },
      { name: "Gillian Flynn", function: "Writing", role: "Screenplay" },
      { name: "Reese Witherspoon", function: "Production", role: "Producer" },
      { name: "Leslie Dixon", function: "Production", role: "Producer" },
      { name: "Bruna Papandrea", function: "Production", role: "Producer" },
      { name: "Laray Mayfield", function: "Production", role: "Casting" },
      { name: "Jeff Cronenweth", function: "Camera", role: "Director of Photography" },
      { name: "Kirk Baxter", function: "Editing", role: "Editor" },
    ],
    reviews: [
      {
        headline: "It Surprises you and those 150 minutes never feel that long",
        content: "2014 has had it's good share of movies and good movies for that matter, we've had the Nolan's Mind boggling interstellar to start with and then the grand Budapest hotel which got much of the appreciation by all and sundry. We had our good share of sequels and prequels ranging from The Planet of Apes series to spider-man, X-men, Hobbit, how to train your dragon, 300, Hunger games, 22 jump street, horrible bosses two, dumb and dumber two, transformers, expendables and.... *Sigh* it doesn't stop here there's more to them a lot more but it isn't about all of these.\n
                  The movie starts as a normal murder mystery and somewhere 15-20 minutes in the movie you'd be like what makes it deserve all that appreciation? But wait, it hasn't even started yet. It isn't all what it seems like and one surely can't judge the book by its cover in this case. The movie is fully of surprises and at the end of it you'd be all smiles that's all i can say!\n
                  I'm not here to give away spoilers but if you haven't watched this masterpiece yet just rush back home and order it on Netflix or buy the DVD.",
        user: "michal.zimi@gmail.com"
      }
    ],
    ratings: [
      {
        stars: 4,
        user: "michal.zimi@gmail.com"
      },
      {
        stars: 5,
        user: "ania.zimi@gmail.com"
      }
    ]
  }
]
require 'json'
puts movies_info.to_json