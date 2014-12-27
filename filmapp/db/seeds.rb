# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


m = Movie.new(title: 'Gone Girl', description: "With his wife's disappearance having
 become the focus of an intense media circus, a man sees the spotlight turned on him when
 it's suspected that he may not be innocent.", webpage: 'http://www.gonegirlmovie.com/', runtime: 145,
 language: 'English')
 
g1 = Genre.new(name: 'Drama')
g2 = Genre.new(name: 'Thriller')
g1.save!
g2.save!
m.save!
m.genres << g1
m.genres << g2
m.save!

ReleaseDate.new(movie: m, date: Date.new(2014, 10, 3), country: 'United States').save!
ReleaseDate.new(movie: m, date: Date.new(2014, 10, 9), country: 'Poland').save!

actors = []
actors << Actor.new(name: 'Ben Affleck')
actors << Actor.new(name: 'Tyler Perry')
actors << Actor.new(name: 'Rosamund Pike')
actors << Actor.new(name: 'Neil Patrick Harris')
actors << Actor.new(name: 'Missi Pyle')
actors << Actor.new(name: 'Patrick Fugit')
actors << Actor.new(name: 'Kim Dickens')
actors << Actor.new(name: 'Casey Wilson')
actors << Actor.new(name: 'Kathleen Rose Perkins')
actors << Actor.new(name: 'Emily Ratajkowski')
actors << Actor.new(name: 'Scoot McNairy')
actors << Actor.new(name: 'Boyd Holbrook')
actors << Actor.new(name: 'Carrie Coon')

actors.each { |actor| actor.save! }

Cast.new(movie: m, actor: actors[0], character: 'Nick Dunne').save!
Cast.new(movie: m, actor: actors[1], character: 'Amy Dunne').save!
Cast.new(movie: m, actor: actors[2], character: 'Tanner Bolt').save!
Cast.new(movie: m, actor: actors[3], character: 'Desi Collins').save!
Cast.new(movie: m, actor: actors[4], character: 'Ellen Abbott').save!
Cast.new(movie: m, actor: actors[5], character: 'Detective Jim Gulpin').save!
Cast.new(movie: m, actor: actors[6], character: 'Detective Rhonda Boney').save!
Cast.new(movie: m, actor: actors[7], character: 'Noelle Hawthorne').save!
Cast.new(movie: m, actor: actors[8], character: 'Shawna Kelly').save!
Cast.new(movie: m, actor: actors[9], character: 'Andie Hardy').save!
Cast.new(movie: m, actor: actors[10], character: 'Tommy').save!
Cast.new(movie: m, actor: actors[11], character: 'Jeff').save!
Cast.new(movie: m, actor: actors[12], character: 'Margo Dunne').save!

Crew.new(name: 'David Fincher', movie: m, function: 'Directing', role: 'Director').save!
Crew.new(name: 'Gillian Flynn', movie: m, function: 'Writing', role: 'Novel').save!
Crew.new(name: 'Gillian Flynn', movie: m, function: 'Writing', role: 'Screenplay').save!
Crew.new(name: 'Reese Witherspoon', movie: m, function: 'Production', role: 'Producer').save!
Crew.new(name: 'Leslie Dixon', movie: m, function: 'Production', role: 'Producer').save!
Crew.new(name: 'Bruna Papandrea', movie: m, function: 'Production', role: 'Producer').save!
Crew.new(name: 'Laray Mayfield', movie: m, function: 'Production', role: 'Casting').save!
Crew.new(name: 'Jeff Cronenweth', movie: m, function: 'Camera', role: 'Director of Photography').save!
Crew.new(name: 'Kirk Baxter', movie: m, function: 'Editing', role: 'Editor').save!